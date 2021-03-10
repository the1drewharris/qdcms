window.addEvent('domready',function(){
	var xlsortArr = $$('#chosenxlfields,#xlfields');
	var dbsortArr = $$('#dbfields,#chosendbfields');
	new Sortables(dbsortArr,{opacity: 1, constrain: false}).serialize();
	new Sortables(xlsortArr,{opacity: 1, constrain: false}).serialize();
	
	$('submit').addEvent('click', function()
	{
		var selecteddbcolumns=$('chosendbfields').getElements('li[id^=columndb]');
		var selectedxlcolumns=$('chosenxlfields').getElements('li[id^=columnxl]');
		var sdbc="";
		var sdbcL=0;
		var sxlc="";
		var sxlcL=0;
		selecteddbcolumns.each(function(el){
			if(sdbc=="") sdbc=el.getProperty('id').replace('columndb_','');
			else sdbc=sdbc + ',' + el.getProperty('id').replace('columndb_','');
			sdbcL++;
		});
		
		selectedxlcolumns.each(function(el){
			if(sxlc=="") sxlc=el.getProperty('id').replace('columnxl_','');
			else sxlc=sxlc + ',' + el.getProperty('id').replace('columnxl_','');
			sxlcL++;
		});
		
		if(sdbcL>0 && sxlcL>0)
		{
			if(sdbcL==sxlcL)
			{
				var req = new Request({
					method: 'post',
					data: {'dbc': sdbc, 'xlc': sxlc},
					url: '/cms/crm/addressbook/actionaddtoaddressbook',
					onSuccess: function(responseText){
				        location.href="/cms/crm/addressbook/showcontacts";
				    }
				}).send();
			}
			else alert('Selected fields in both sides must be equal');
		}
		else alert('Selected fields on both sides should not be empty');
	});
});