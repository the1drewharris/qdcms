window.addEvent('domready', function()
{
	init();
});

function init() 
{
	var checkBoxes = $('managePagesTable').getElements('input[id^=file]');
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
	
	if ($('deletefile')) {
		$('deletefile').addEvent('click', function(el){
			checkedString = checkedArray.toString();
			$('deletefile').setProperty('href', '/cms/media/filemgmt/deletefile/?fileList=' + checkedString);
		});
	}
}

checkedArray = new Array();

var checkItem = function(el,checked) 
{
	itemID = el.getProperty('id').replace('file','');
	el.set('checked',checked);

	if(el.checked) 
	{
		for(ID in checkedArray) 
		{
			if(checkedArray[ID] == itemID) 
			{
				IDExists = 1;
				break;
			} else IDExists = 0;
		}
		if(IDExists == 0)
			checkedArray.push(itemID);
	} else 
		checkedArray.erase(itemID);
}