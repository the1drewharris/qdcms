window.addEvent('domready', function() {
	var today = dateFormat(Date(),'mm/dd/yyyy');
	var month = dateFormat(today,'mm');
	var year = dateFormat(today,'yyyy');	
	var waiter = new Waiter($('calendarContainer'), {msg: 'Loading...', layer: { styles: {opacity: 0.95, background: '#fff' }}});
	var eventCalendar = new Calendar({calContainer: 'eventCalendar',scroller: false});
	var jsonRequest = new Request.JSON({
		url: '/cms/crm/events/geteventdata/?c=' + $('eventcatid').value,
		onRequest: function(){
			waiter.start();
		},
		onComplete: function(cevents){
			eventCalendar.options.cEvents = cevents; 
			waiter.stop();
			eventCalendar.loadCalEvents();
			calEvents();
		}
	}).get({'d': '01','m': month, 'y': year});
	
	function getDateRange() {
		var dateRange = [];
		date = eventCalendar.viewStartDate;
		dateRange[0] = dateFormat(date,'mm');
		dateRange[1] = dateFormat(date,'dd');
		dateRange[2] = dateFormat(date,'yyyy');
		return dateRange;
	}
	
	function oc(a)
	{
	  var o = {};
	  for(var i=0;i<a.length;i++)
	  {
	    o[a[i]]='';
	  }
	  return o;
	}
	
	function calEvents() 
	{
		var ajaxLinks = new Array();
		var windowSize = window.getScrollSize();
		var position;
		var edge;
		var isTB = new Array();
		calContainer = $(eventCalendar.options.calContainer);
		calContainer.getElements('div.calEvent').each(function(el, idx) {
			var eventid = el.getProperty('id').substr(0,16);
			var title = el.innerHTML;
			var x = 0;
			var elemPosition = el.getPosition();
			el.set('html','');
			new Element('a',{'href':'/cms/crm/events/editevent/?eventid='+eventid,'title':'Edit Event','html':title}).inject(el);
			ajaxLinks.push('/cms/crm/events/geteventinfo/?eventid='+eventid);
			if((windowSize.x - elemPosition.x) < 350) {
				position = 'upperLeft';
				edge = 'upperRight';
			} else {
				position = 'upperLeft';
				edge = 'upperRight';
			}
		});
	
		var popup = new PopupDetailCollection(calContainer.getElements('div.calEvent'), {
		  ajaxLinks: ajaxLinks,
		  template: $('popupDetailHTML'),
		  popupDetailOptions: {
		    useAjax: true,
		    onPopupShow: function(e) {
		    	popup.options.popupDetailOptions.stickyWinOptions.position = position;
		    	popup.options.popupDetailOptions.stickyWinOptions.edge = edge;
		    	if(!(e.observer.getProperty('id') in oc(isTB))) {
		    		isTB.push(e.observer.getProperty('id'));
		    		tb_init('a.popupBox');
		    	}
		    },
		    stickyWinOptions: {
		    	position: position,
		    	edge: edge
		    }
		  }
		});
		
		calContainer.getElements('a[class$=Cal]').each(function(el, idx) {
			el.addEvent('click', function(e) {
				if(getDateRange()[0] != month || getDateRange()[2] != year) {
					calContainer.getElements('td').getElements('div.calEvent').each(function(el) {
						el.destroy();
					});
					month = getDateRange()[0];
					day = getDateRange()[1];
					year = getDateRange()[2];
					ym = year+''+month;
					jsonRequest.get({'d':'01','m':month,'y':year,'d':day});
				}
				calEvents();	
			});
		});
		tb_init('a.sweetBox');
	}	
	
	$('eventcatid').addEvent('change', function() {
	window.location = "/cms/crm/events/showevents?c=" + this.value;});
});