var simpleCollapser = new Class({
	implements: [Options, Events],
	options: {
		clickers: [],
		sections: [],
		defaultState: 'hidden',
		clickerClass: 'clickerClass',
		clickerActiveClass: 'sectionVisible',
		duration: 500
	},
    initialize: function(options){
    	this.setOptions(options);
    	this.myFx = [];
  		this.addCollapsers(this.options.clickers,this.options.sections);
    	
   	},
	addCollapsers: function(clickers, sections) {
		clickers = $splat(clickers);
		sections = $splat(sections);
		
		$$(clickers).each(function(clicker, index) {
			var section = sections[index];
	    	
	    	clicker.addClass(this.options.clickerClass).setStyle('cursor','pointer');
	    	
	    	if(clicker) {
		    	if(section) {
		    		this.myFx[index] = new Fx.Reveal(section, {
					    duration: this.options.duration,
					    onShow: function() {
					    	// changes active class for clicker after section is shown
					    	clicker.addClass(this.options.clickerActiveClass);
					    }.bind(this),
					    onHide: function() {
						    // changes active class for clicker after section is hidden
					    	clicker.removeClass(this.options.clickerActiveClass);
					    }.bind(this)
					});
					
					if(this.options.defaultState == 'hidden')
						// hides section if default state has a value of 'hidden'
						section.set('reveal', {duration: 0}).dissolve();
					else
						// adds class to clicker of active class based on options
						clicker.addClass(this.options.clickerActiveClass);	
		    	}
				clicker.addEvent('click', function(e) {
					// stop clicker from propogating if its a link
					e.stop();
					this.myFx[index].toggle();
				}.bind(this));
	    	}

		}, this);
	
	},
	toggle: function(indexToToggle) {
		// toggle to show or hide section
		this.myFx[indexToToggle].toggle();
	}
});
var simpleCollapserDL = new Class ({
	Extends: simpleCollapser,
	options: {
		dl: false,
		handle: false
	},
	initialize: function(options) {
		this.parent(options);		
		if(!this.options.dl) return;
		if(this.options.handle) var handle = this.options.dl.getElements('.' + this.options.handle);
		else var handle = this.options.dl.getChildren('dt');
		this.addCollapsers(handle,this.options.dl.getChildren('dd'));
	},
	toggle: function() {
		this.parent();
	}
});
simpleCollapser.implement(new Options, new Events);