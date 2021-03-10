window.addEvent('domready', function()
{
	init();
});

function init() {
	
	var checkBoxes = $('managePagesTable').getElements('input[id^=wp]');
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
	
	if($('delete')) {
		$('delete').addEvent('click', function(el) {
			checkedString = checkedArray.toString();
			$('delete').setProperty('href','/cms/content/webpages/delete/?wpList=' + checkedString);
		});
	}
	
	if($('truedelete')) {
		$('truedelete').addEvent('click', function(el) {
			checkedString = checkedArray.toString();
			$('truedelete').setProperty('href','/cms/content/webpages/truedelete/?wpList=' + checkedString);
		});
	}
	
	if($('copy')) {
		$('copy').addEvent('click', function(el) {
			checkedString = checkedArray.toString();
			$('copy').setProperty('href','/cms/content/webpages/copy/?wpList=' + checkedString);
		});
	}
	
	if($('deleteWPTemplate')) {
		$('deleteWPTemplate').addEvent('click', function(el) {
			checkedString = checkedArray.toString();
			$('deleteWPTemplate').setProperty('href','/cms/content/webpages/deleteWPTemplate/?templateList=' + checkedString);
		});
	}
	
	if($('copyWPTemplate')) {
		$('copyWPTemplate').addEvent('click', function(el) {
			checkedString = checkedArray.toString();
			$('copyWPTemplate').setProperty('href','/cms/content/webpages/copyWPTemplate/?templateList=' + checkedString);
		});
	}
	
}

checkedArray = new Array();

var checkItem = function(el,checked) {
	itemID = el.getProperty('id').replace('wp','');
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