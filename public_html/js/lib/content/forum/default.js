window.addEvent('domready', function()
{
	init();
});

function init() {

	var checkBoxes = $('managePagesTable').getElements('input[id^=forum]');
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
	
	if($('movetopics')) {
		$('movetopics').addEvent('click', function(el) {
			checkedString = checkedArray.toString();
			tb_init(el);
			$('movetopics').setProperty('href',"/cms/content/forum/chooseForum/?layout=tbcontainer&topicList=" + checkedString);
		});
	}
	
	if ($('delete')) {
		$('delete').addEvent('click', function(el){
			checkedString = checkedArray.toString();
			$('delete').setProperty('href', '/cms/content/forum/delete/?forumList=' + checkedString);
		});
	}
	
	if ($('deleteposts')) {
		$('deleteposts').addEvent('click', function(el){
			checkedString = checkedArray.toString();
			$('deleteposts').setProperty('href', '/cms/content/forum/deleteposts/?postList=' + checkedString);
		});
	}
	
	if ($('ignorereport')) {
		$('ignorereport').addEvent('click', function(el){
			checkedString = checkedArray.toString();
			$('ignorereport').setProperty('href', '/cms/content/forum/ignorereport/?postList=' + checkedString);
		});
	}
	
	if ($('deletetopics')) {
		$('deletetopics').addEvent('click', function(el){
			checkedString = checkedArray.toString();
			$('deletetopics').setProperty('href', '/cms/content/forum/deletetopics/?topicList=' + checkedString);
		});
	}
	
	if ($('approveposts')) {
		$('approveposts').addEvent('click', function(el){
			checkedString = checkedArray.toString();
			$('approveposts').setProperty('href', '/cms/content/forum/approveposts/?postList=' + checkedString);
		});
	}
	
	if ($('restoreforums')) {
		$('restoreforums').addEvent('click', function(el){
			checkedString = checkedArray.toString();
			$('restoreforums').setProperty('href', '/cms/content/forum/restoreforums/?forumList=' + checkedString);
		});
	}
	
	if ($('restoretopics')) {
		$('restoretopics').addEvent('click', function(el){
			checkedString = checkedArray.toString();
			$('restoretopics').setProperty('href', '/cms/content/forum/restoretopics/?topicList=' + checkedString);
		});
	}
	
	if ($('restoreposts')) {
		$('restoreposts').addEvent('click', function(el){
			checkedString = checkedArray.toString();
			$('restoreposts').setProperty('href', '/cms/content/forum/restoreposts/?postList=' + checkedString);
		});
	}
	
	if ($('moveposts')) {
		$('moveposts').addEvent('click', function(el){
			checkedString = checkedArray.toString();
			$('moveposts').setProperty('href', '/cms/content/forum/moveposts/?postList=' + checkedString);
		});
	}
	if ($('movetopics')) {
		$('movetopics').addEvent('click', function(el){
			checkedString = checkedArray.toString();
			$('movetopics').setProperty('href', '/cms/content/forum/movetopics/?topicList=' + checkedString);
		});
	}
	if ($('moveforums')) {
		$('moveforums').addEvent('click', function(el){
			checkedString = checkedArray.toString();
			$('moveforums').setProperty('href', '/cms/content/forum/moveforums/?forumList=' + checkedString);
		});
	}
	
}

	checkedArray = new Array();

	var checkItem = function(el,checked) {
		itemID = el.getProperty('id').replace('forum','');
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