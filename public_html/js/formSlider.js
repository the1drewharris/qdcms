var formSlider = new Class({
	options: {
		useTitleEl: 'yes',
		titleEl: 'dt',
		slideElClass: 'slideElement',
		activeClass: 'slideActive',
		defaultState: 'hide',
		duration: 500
	},
    initialize: function(container, options){
    	this.setOptions(options);
    	this.containerName = container;
    	this.container = $(container);
    	this.defaultState = this.options.defaultState;
    	this.titleEl = this.options.titleEl;
    	this.slideElClass = this.options.slideElClass;
    	this.slideArray = new Array();
    	this.duration = this.options.duration;
    	
    	// Make sure the container passed in actually exists
    	if(this.container) {
			if(this.defaultState != 'hide') this.container.getElement(this.titleEl).addClass(this.options.activeClass);
    		this.childSlide = this.container.getElement('.' + this.slideElClass);
    		// Check to make sure there are actually title elements in the container
    		if(this.childSlide) {
    			this.setDisplay(this.childSlide);
    			if(this.options.useTitleEl == 'yes') {
    				this.childrenTitle = this.container.getElement(this.titleEl);
    				tempID = "temp" + this.titleEl;
    				this.childrenTitle.setProperty('id', tempID);
    				this.toggleSlide(tempID);
    			}
    		} else {
    			return false;
    		}
    	} else {
    		// If container does not actually exist then stop
    		return false;
    	}
	},
	setDisplay: function(slideElement) {
		this.slideElAnim = new Fx.Slide(slideElement, {duration: this.duration});
		if(this.defaultState == 'hide') { this.slideElAnim.hide() };
	},
	simpleMsg: function() {
		console.log("Container Passed In: " + this.containerName);
	},
	toggle: function(ElID) {
		$(ElID).toggleClass(this.options.activeClass);
		this.slideElAnim.toggle();
	},
	toggleSlide: function(ClickElID) {
 		$(ClickElID).setStyle('cursor','pointer'); 
 		$(ClickElID).addEvent('click', this.toggle.bind(this, ClickElID));
	}
});
formSlider.implement(new Options, new Events);
