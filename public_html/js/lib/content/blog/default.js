window.addEvent('domready', function()
{
	init();
});

function init() {

	var checkBoxes = $('managePagesTable').getElements('input[id^=blog]');
	do_check = false;
	$('selectAll').checked = false;
	checkBoxes.each(function(el) { 
		checkItem(el,do_check);
		el.addEvent('click', function(el) {
			if(this.checked) checkItem(this,true);
			else checkItem(this,false);
		});	
	});
	
	$('selectAll').addEvent('click', function(){
		if(this.checked) { do_check = true; }
		else { do_check = false; }
		checkBoxes.each(function(el) { checkItem(el,do_check) });
	});
	
	if ($('deleteblog')) {
		$('deleteblog').addEvent('click', function(el){
			checkedString = checkedArray.toString();
			$('deleteblog').setProperty('href', '/cms/content/blog/deleteblog/?blogList=' + checkedString);
		});
	}
	
	if ($('deleteblogCategory')) {
			$('deleteblogCategory').addEvent('click', function(el){
			checkedString = checkedArray.toString();
			$('deleteblogCategory').setProperty('href', '/cms/content/blog/deleteblogCategory/?blogCategoryList=' + checkedString);
		});
	}
	
	if ($('deleteblogEntry')) {
		$('deleteblogEntry').addEvent('click', function(el){
			checkedString = checkedArray.toString();
			$('deleteblogEntry').setProperty('href', '/cms/content/blog/deleteblogEntry/?blogentryList=' + checkedString);
		});
	}
	
	if ($('copyblogEntry')) {
		$('copyblogEntry').addEvent('click', function(el){
			checkedString = checkedArray.toString();
			$('copyblogEntry').setProperty('href', '/cms/content/blog/copyblogEntry/?blogentryList=' + checkedString);
		});
	}
	
}

	checkedArray = new Array();

	var checkItem = function(el,checked) {
		itemID = el.getProperty('id').replace('blog','');
		el.set('checked',checked);
	
		if(el.checked) {
			for(ID in checkedArray) {
				if(checkedArray[ID] == itemID) {
					IDExists = 1;
					break;
				} else
					IDExists = 0;
			}
			if(IDExists == 0)
				checkedArray.push(itemID);
		} else 
			checkedArray.erase(itemID);
	}