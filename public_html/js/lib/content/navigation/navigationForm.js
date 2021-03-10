if($get('navid') == '') navid = 0;
else navid = $get('navid');

var DumpIt = function() {
	var theDump = sortIt.serializenotitle();
	new Request({
		'url': '/cms/content/navigation/savenavigation', 
		data: 'm='+Json.toString(theDump)+'&authorid='+$('authorid').value+'&status='+$('status').value+'&name='+$('name').value+'&navid=' + navid, 
		onSuccess: function(txt) {
			window.location = '/cms/content/navigation';
		}, 
		onFailure: function(txt) {
			alert('There\'s an issue with navigation right now.')
		}
	}).send();
};

var InsertIt = function(el) {
	if(el.getProperty('alt') == 'wp')
		var li = new Element('li').setProperties({class: 'new', style: 'color:BLACK', id: 'item'+el.getProperty('rel'), title: el.getProperty('title')}).appendText(el.getProperty('title')).injectInside($('new-nav'));
	else
		var li = new Element('li').setProperties({class: 'new', style: 'color:RED', id: 'link'+el.getProperty('rel'), title: el.getProperty('title')}).appendText(el.getProperty('title')).injectInside($('new-nav'));
	AddDeleteButton(li);
};

var InsertNest = function(el,parent) {
	var parentLI = parent.getLast('li#item' + el.getProperty('rel'));
	var ul = new Element('ul').setProperties({class: 'new', id: el.getProperty('rel')}).inject(parentLI);	
	return ul;
};

var CreateNest = function(el,ul) {
	if(ul == '') {
		InsertIt(el);
		ul = $('new-nav');
	} 
	else {
		var li = new Element('li',{'class':'new','id': 'item'+el.getProperty('rel'), title: el.getProperty('title'),'html': el.getProperty('title')}).inject(ul);
		AddDeleteButton(li);
	}
	parentUL = el.getNext('ul');
	if(parentUL) {
		ul = InsertNest(el,ul);
		parentUL.getElements('a.addMe[parentid=' + el.getProperty('rel') + ']').each(function(el) {
			anotherUL = el.getNext('ul');
			CreateNest(el,ul);
		});
	}
}

var toggleRemove = function() {
	this.parentNode.destroy();
}

var AddDeleteButton = function(el) {
	el.appendText(' '); 
	if(!el.getElement('ul'))
		new Element('img').setProperties({src: '/siteimages/delete.png', alt: 'delete'}).addEvent('click', toggleRemove).injectInside(el);
	else 
		var deleteImg = new Element('img').setProperties({src: '/siteimages/delete.png', alt: 'delete'}).addEvent('click', toggleRemove).inject(el.getElement('ul'), 'before');
}

var sortIt;
window.addEvent('domready', init);
function init() {
	sortIt = new Nested('new-nav', {
		collapse: true,
		onStart: function(el) {
			el.addClass('drag');
		},
		onComplete: function(el) {
			el.removeClass('drag');
		}
	});
	
	$('save').addEvent('click', DumpIt);
	
	$('itemsToAdd').getElements('a.addMe').each(function(el) {
		el.addEvent('click', function(e) {
			e.stop();
			InsertIt(el);
		});
	})
	
	$('itemsToAdd').getElements('a.addMeAndChildren').each(function(el) {
		el.addEvent('click', function(e) {
			e.stop();
			CreateNest(el,'');
		});
	})
					
	$ES('li','new-nav').each(function(el) {
		AddDeleteButton(el);
	})
}