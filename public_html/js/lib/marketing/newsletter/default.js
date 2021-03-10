window.addEvent('domready', init);
function init() {
	
	var checkBoxes = $('managePagesTable').getElements('input[id^=newsletter]');
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
	
	if ($('delete')) {
		$('delete').addEvent('click', function(el){
			checkedString = checkedArray.toString();
			$('delete').setProperty('href', '/cms/marketing/newsletter/deletenewsletter/?NewsletterList=' + checkedString);
		});
	}
	
	if ($('copy')) {
		$('copy').addEvent('click', function(el){
			checkedString = checkedArray.toString();
			$('copy').setProperty('href', '/cms/marketing/newsletter/copynewsletter/?NewsletterList=' + checkedString);
		});
	}
	
	if($('deleteTemplate')) {
		$('deleteTemplate').addEvent('click', function(el) {
			checkedString = checkedArray.toString();
			$('deleteTemplate').setProperty('href','/cms/marketing/newsletter/deletenewsletterTemplate/?templateList=' + checkedString);
		});
	}
	
	if($('copyTemplate')) {
		$('copyTemplate').addEvent('click', function(el) {
			checkedString = checkedArray.toString();
			$('copyTemplate').setProperty('href','/cms/marketing/newsletter/copynewsletterTemplate/?templateList=' + checkedString);
		});
	}
		
}

	checkedArray = new Array();

	var checkItem = function(el,checked) {
		itemID = el.getProperty('id').replace('newsletter','');
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