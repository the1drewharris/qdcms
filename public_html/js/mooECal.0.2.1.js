//	Mootools Events Calendar v0.2.1 (2009-02-09) - http://dansnetwork.com/mootools/events-calendar

/*
	Script: mooECal.js
		Class for creating an events calendar with multiple views
	
	Requires:
		Mootools 1.2.1 Core
		Mootools 1.2.1 More
			Tips
			Scroller

	License:
		MIT-style license.
*/
var Calendar = new Class({
	
	Implements: [Options, Events],
	options: {
		calContainer: 'calBody', // id of the element that the calendar will be "injected" into
		newDate: 0, // used to set the initial selected date to one other than the current day
		view: 'month', // options are: month, week, day - sets the default view
		type: 'calendar', // options are: calendar, picker - sets the type of calendar
		showViews: true, // This is true/false depending on if views should be displayed or not
		feedPlugin: '', // default (empty string) uses cEvents[] for manual event entry
		feedSpan: 3, // This is the number of months (past and future) of events to retrieve. Not needed for manual event entry using cEvents.
		scroller: true,
		cEvents: [] //event container
		/*cEvents: [ //simulate JSON feed
			{
				title:'Get Groceries',
				start:'2009-2-05',
				end:'2009-2-06',
				location:'Store'
			},
			{
				title:'Goin Cow Tip\'n',
				start:'2009-2-20T23:30:00-06:00',
				end:'2009-2-20T24:30:00-06:00',
				location:''
			},
			{
				title:'Hair Cut',
				start:'2009-2-22T13:00:00-06:00',
				end:'2009-2-22T13:30:00-06:00',
				location:''
			}
		]*/
	},
	initialize: function(options){
		this.setOptions(options);
		if(this.options.type == 'calendar') 
			this.days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
		else
			this.days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
		this.months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
		this.daysInMonth = 30; // can be set with setDaysInMonth(month,year)
		this.options.newDate != 0 ? this.calDate = new Date(this.options.newDate) : this.calDate = new Date();
		this.startingOffset = 0; // determine the offset of the first of the month and Sunday - used for the "month" view
		this.viewStartDate = new Date(); // starting date for current view
		this.viewEndDate = new Date(); // ending date for current view
		this.gotEvents = false; // initial request for the events feed
		this.eventRangeStart = new Date(); //current range of events that have been fetched
		this.eventRangeEnd = new Date();
		this.setCalParams();
		this.extendDate();
		switch(this.options.view){
			case 'month':
				this.showMonth();
				break;
			case 'week':
				this.showWeek();
				break;
			case 'day':
				this.showDay();
				break;
			default:
				this.showMonth;
		}
	},
	setDaysInMonth: function(month, year){ // month: must be an integer (0 - 11) year: used to dertermine if leap year exists
		var daysInMonths = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
		if(new Date(year,1,29).getDate() == 29) // determine if leap year
			daysInMonths[1] = 29;
		this.daysInMonth = daysInMonths[month];
	},
	setStartingOffset: function(month,year){ // month: must be an integer (0 - 11)
		this.startingOffset = new Date(year,month,1).getDay();
	},
	setDate: function(day){
		this.calDate.setDate(day);
	},
	setCalParams: function(){
		this.setDaysInMonth(this.calDate.getMonth(), this.calDate.getFullYear());
		this.setStartingOffset(this.calDate.getMonth(), this.calDate.getFullYear());
	},
	showControlsRow: function(calTitle){
		var trC = new Element('tr', {
			'class':'trControls'
		});
		var thC = new Element('th', {
			'colspan': '7',
			'class':'thControls'
		}).inject(trC);
		var ulControls = new Element('ul',{
			'class':'ulControls'
		}).inject(thC);
			var liNextCal = new Element('li', {
				'class':'liNextCal'
			}).inject(ulControls);
				var aNextCal = new Element('a',{
					'href':'javascript:void(0)',
					'class':'aNextCal'
				}).set('html','&#9658').inject(liNextCal);
			var liViewPicker = new Element('li',{
				'class':'liViewPicker'
			}).inject(ulControls);
			if(this.options.showViews) {
				var ulViewPicker = new Element('ul',{
					'class':'ulViewPicker'
				}).inject(liViewPicker);
					var liMonthPicker = new Element('li', {
						'class':'liMonthPicker'
					}).inject(ulViewPicker);
						new Element('a',{
							'href':'javascript:void(0)',
							'class':'aViewCal',
							'events':{
								'click':function(){
									this.showMonth()
								}.bind(this)
							}
						}).set('text','month').inject(liMonthPicker);
					var liWeekPicker = new Element('li', {
						'class':'liWeekPicker'
					}).inject(ulViewPicker);
						new Element('a',{
							'href':'javascript:void(0)',
							'class':'aViewCal',
							'events':{
								'click':function(){
									this.showWeek()
								}.bind(this)
							}
						}).set('text','week').inject(liWeekPicker);
					var liDayPicker = new Element('li', {
						'class':'liDayPicker'
					}).inject(ulViewPicker);
						new Element('a',{
							'href':'javascript:void(0)',
							'class':'aViewCal',
							'events':{
								'click':function(){
									this.showDay()
								}.bind(this)
							}
						}).set('text','day').inject(liDayPicker);
			}			
			var liHeaderCal = new Element('li', {
				'class':'liHeaderCal'
			}).set('html',calTitle).inject(ulControls);
			var liPrevCal = new Element('li', {
				'class':'liPrevCal'
			}).inject(ulControls);
				var aPrevCal = new Element('a',{
					'href':'javascript:void(0)',
					'class':'aPrevCal'
				}).set('html','&#9668').inject(liPrevCal);
			var liLoading = new Element('li', {
				'class':'liLoading'
			}).inject(ulControls);
				new Element('span',{
					'styles':{
						'visibility':'hidden'
					},
					'id':'loading'
				}).set('html','loading...').inject(liLoading);
		
		switch(this.options.view){
			case 'month':
				aPrevCal.addEvent('click',function(){
					this.showPrevMonth()
				}.bind(this));
				aNextCal.addEvent('click',function(){
					this.showNextMonth()
				}.bind(this));
				break;
			case 'week':
				aPrevCal.addEvent('click',function(){this.showPrevWeek()}.bind(this));
				aNextCal.addEvent('click',function(){this.showNextWeek()}.bind(this));
				break;
			case 'day':
				aPrevCal.addEvent('click',function(){this.showPrevDay()}.bind(this));
				aNextCal.addEvent('click',function(){this.showNextDay()}.bind(this));
				break;
		}
		return trC;
	},
	showDowRow: function(){
		var tr = new Element('tr',{
			'class':'dowRow'
		});
		var th = new Element('th',{
			'colspan': '7'
		}).inject(tr);
		var ul = new Element('ul').inject(th);
		for (var i = 0; i < 7; i++){
			new Element('li').set('text', this.days[i]).inject(ul);
		}
			
		return tr;
	},
	showNextMonth: function(){
		this.calDate.nextMonth();
		this.setCalParams();
		this.showMonth();
	},
	showPrevMonth: function(){
		this.calDate.prevMonth();
		this.setCalParams();
		this.showMonth();
	},
	showMonth: function(){
		$(this.options.calContainer).set('html','');
		this.options.view = 'month';
		var table = new Element('table',{
			'cellspacing':'0',
			'class':'mooECal',
			'id':'monthCal'
		});
		var thead = new Element('thead').inject(table);
		var tbody = new Element('tbody').inject(table);
		
		this.showControlsRow(this.months[this.calDate.getMonth()]+' '+this.calDate.getFullYear()).inject(thead);
		
		this.showDowRow().inject(thead);
		
		var calDone = false;
		for (var i = 0; i < 6; i++){
			if(calDone){
				break;
			}
			var tr = new Element('tr',{'class':'monthWeek'}).inject(tbody); // create weeks
			for (var j = 0; j < 7; j++) {
				var day = ((j+1) + (i*7)) - this.startingOffset;
				var td = new Element('td',{'class':'monthDay','id':'day'+day}).inject(tr); // create days
				if (day > 0 && day <= this.daysInMonth){
					td.set({
						events: {
							'mouseover': function(){this.addClass('hover')},
							'mouseout': function(){this.removeClass('hover')},
							'dblclick': function(e){
								this.setDate(e.target.retrieve('date'));
								this.showDay();
							}.bind(this)
						}
					});
					new Element('span',{'text':day}).store('date',day).inject(td);
					td.store('date',day);
					td.addEvent('click', function(e){
						$(this.options.calContainer).getElements('td.monthDay').each(function(el){el.removeClass('selected')});
						if(e.target.hasClass('monthDay'))
							e.target.addClass('selected');
						else 
							e.target.getParent('td').addClass('selected');
					}.bind(this));
					td.addEvent('click',function(e){
						this.setDate(e.target.retrieve('date'))
					}.bind(this));
					new Element('div').store('date',day).inject(td);
					if(day == this.calDate.getDate()) //set background color for current day
						td.addClass('selected');
					if(day == this.daysInMonth)
						calDone = true;
				}
				else{
					td.set('html', '&nbsp;'); // IE won't show td borders without something in the cell
				}
			}
		}
		
		this.viewStartDate.setTime(this.calDate.valueOf());
		this.viewStartDate.setDate(1);
		this.viewEndDate.setTime(this.calDate.valueOf());
		this.viewEndDate.setDate(this.daysInMonth);
		this.viewStartDate.startOfDay();
		this.viewEndDate.endOfDay();
		
		table.inject($(this.options.calContainer));
		this.getCalEvents();
		
	}, // end of showMonth
	showNextWeek: function(){
		var nWeek = this.calDate.getDate();
		this.calDate.setDate(nWeek+7)
		this.setCalParams();
		this.showWeek();
	},
	showPrevWeek: function(){
		var pWeek = this.calDate.getDate();
		this.calDate.setDate(pWeek-7)
		this.setCalParams();
		this.showWeek();
	},
	showWeek: function(){
		var wDate = new Date(this.calDate.toLocaleString());
		var dow = wDate.getDay();
		wDate.setDate(wDate.getDate()-dow); //set date to Sunday (for first day of the week
		var lastDay = new Date(wDate.toLocaleString()); // used for header info(last day of the week)
		lastDay.setDate(lastDay.getDate()+6);
		
		$(this.options.calContainer).set('html', '');
		this.options.view = 'week';
		var table = new Element('table', {
			'cellspacing':'0',
			'class':'mooECal',
			'id': 'weekCal'
		});
		var thead = new Element('thead').inject(table);
		var tbody = new Element('tbody').inject(table);
			
		this.showControlsRow(this.months[wDate.getMonth()]
			+ ' ' + wDate.getDate() + ', ' + wDate.getFullYear() + '&nbsp; - &nbsp;'
			+ this.months[lastDay.getMonth()]
			+ ' ' + lastDay.getDate() + ', ' + lastDay.getFullYear()).inject(thead);
		
		this.viewStartDate.setTime(wDate.valueOf());
		this.viewEndDate.setTime(lastDay.valueOf());
		this.viewStartDate.startOfDay();
		this.viewEndDate.endOfDay();
			
		this.showDowRow().inject(thead);
		
		var trWeek = new Element('tr',{'class':'weekWeek'}).inject(tbody); // create week
		for(var i = 0; i < 7; i++){
			var td = new Element('td',{
				'class':'weekDay',
				'id':'day'+wDate.getDate()
			}).inject(trWeek); // create days
			td.set({
				events: {
					'mouseover': function(){
						this.addClass('hover')
					},
					'mouseout': function(){
						this.removeClass('hover')
					},
					'dblclick': function(e){
						this.setDate(e.target.retrieve('date'));
						this.showDay();
					}.bind(this)
				} 
			});
			new Element('span',{'text':wDate.getDate()}).store('date',wDate.getDate()).inject(td);
			td.store('date',wDate.getDate());
			td.addEvent('click', function(){
				$$('td.weekDay').each(function(td){
					td.removeClass('selected')
				});
				this.addClass('selected');
			});
			td.addEvent('click',function(e){
				this.setDate(e.target.retrieve('date'))
			}.bind(this));
			new Element('div').store('date',wDate.getDate()).inject(td);
			if(wDate.getDate() == this.calDate.getDate()) //set background color for current day
				td.addClass('selected');
			wDate.setDate(wDate.getDate()+1);
		}
		table.inject($(this.options.calContainer));
		this.getCalEvents();
	}, //end of showWeek
	showNextDay: function(){
		var nDay = this.calDate.getDate();
		this.calDate.setDate(nDay+1)
		this.setCalParams();
		this.showDay();
	},
	showPrevDay: function(){
		var pDay = this.calDate.getDate();
		this.calDate.setDate(pDay-1)
		this.setCalParams();
		this.showDay();
	},
	showDay: function(){
		$(this.options.calContainer).set('html', '');
		this.options.view = 'day';
		var table = new Element('table', {
			'cellspacing':'0',
			'class':'mooECal',
			'id': 'dayCal'
		});
		var thead = new Element('thead').inject(table);
		var tbody = new Element('tbody').inject(table);
		
		this.showControlsRow(this.days[this.calDate.getDay()]+' - '+this.months[this.calDate.getMonth()]
			+ ' ' + this.calDate.getDate() + ', ' + this.calDate.getFullYear()).inject(thead);
		
		var trDay = new Element('tr').inject(tbody);
		var td = new Element('td',{
			'class':'dayDay',
			'id':'day'+this.calDate.getDate()
		}).inject(trDay); // create day
		td.set({
			'colspan':'7'
		});
		new Element('div',{
			'html':'&nbsp;',
			'styles':{
				'overflow':'auto'
			}
		}).inject(td);
		
		table.inject($(this.options.calContainer));
		this.viewStartDate.setTime(this.calDate.valueOf());
		this.viewEndDate.setTime(this.calDate.valueOf());
		this.viewStartDate.startOfDay();
		this.viewEndDate.endOfDay();
		this.getCalEvents();
	}, //end of showDay
	getCalEvents: function(){
		if ((!this.gotEvents || this.viewStartDate < this.eventRangeStart || this.viewEndDate > this.eventRangeEnd) && this.options.feedPlugin != '') {
			this.eventRangeStart.setTime(this.viewStartDate.getTime());
			this.eventRangeEnd.setTime(this.viewEndDate.getTime());
			this.eventRangeStart.setMonth(this.eventRangeStart.getMonth()-this.options.feedSpan);
			this.eventRangeEnd.setMonth(this.eventRangeEnd.getMonth()+this.options.feedSpan);
			$('loading').fade('in');
			this.options.feedPlugin.getEvents(this,this.eventRangeStart,this.eventRangeEnd)
		}
		else
			this.loadCalEvents();
	},
	loadCalEvents: function(){
		var time = '';
		// $$('div.tip').each(function(divs){divs.getParent().destroy();}); // Tips cleanup - tip divs kept building up after switching calendar views
		for(var i = 0; i < this.options.cEvents.length; i++){
			var eStart = new Date();
			eStart.setISO8601(this.options.cEvents[i].start);
			time = (this.options.cEvents[i].start.toString().match(new RegExp(/(\d\d\d\d-\d\d-\d\dT)/))) ? eStart.thTime() : '';
			if(eStart >= this.viewStartDate && eStart <= this.viewEndDate){
				var eventDiv = new Element('div',{
					'html':time+' '+this.options.cEvents[i].title,
					'id': this.options.cEvents[i].id,
					'class':'calEvent'
				}).store('date',eStart.getDate()).inject($(this.options.calContainer).getElement('table').getElement('td[id=day'+eStart.getDate()+']').getChildren('div')[0]);
				if (this.options.view != 'month') // the month view only shows a portion of the event description
					eventDiv.addClass('fullEvent');
				else {
					if(this.options.scroller)
						new Scroller($('day' + eStart.getDate()).getChildren('div')[0],{'area':20}).start(); //add Scroller to month view days
					// new Tips(eventDiv, {onShow: function(tip){tip.setStyle('opacity', '0.9');}});
					eventDiv.store('tip:title',time).store('tip:text',this.options.cEvents[i].title + '<br /><i>'+this.options.cEvents[i].location+'</i>');
				}
			}
		}
	},
	extendDate: function(){ // this section could also be implemented with MooTools::Implement (no pun intended)
		function prevMonth(){
			var thisMonth = this.getMonth();
			this.setMonth(thisMonth-1);
			if(this.getMonth() != thisMonth-1 && (this.getMonth() != 11 || (thisMonth == 11 && this.getDate() == 1))){
				this.setDate(0);
			}
		};
		function nextMonth(){
			var thisMonth = this.getMonth();
			this.setMonth(thisMonth+1);
			if(this.getMonth() != thisMonth+1 && this.getMonth() != 0)
				this.setDate(0);
		};
		function startOfDay(){
			this.setHours(0);
			this.setMinutes(0);
			this.setSeconds(0);
			this.setMilliseconds(0);
		};
		function endOfDay(){
			this.setHours(23);
			this.setMinutes(59);
			this.setSeconds(59);
			this.setMilliseconds(999);
		};
		function ymd(){
			var ymdString = this.getFullYear()+'-'+(parseInt(this.getMonth())+1).toString()+'-'+this.getDate();
			return ymdString;
		}
		function thTime(){ // twelve hour time
			var timestring;
			var minutes = this.getMinutes()<10 ? '0'+this.getMinutes().toString() : this.getMinutes().toString();
			if(minutes != '00')
				timestring = this.getHours()>12 ?  
				(this.getHours()-12).toString()+':'+minutes+'pm' : this.getHours().toString()+':'+minutes+'am';
			else
				timestring = this.getHours()>12 ?  
				(this.getHours()-12).toString()+'pm' : this.getHours().toString()+'am';
			return timestring;
		}
		function setISO8601(dString){
			var regexp = /(\d\d\d\d)(-)?(\d\d)(-)?(\d\d)(T)?(\d\d)(:)?(\d\d)(:)?(\d\d)(\.\d+)?(Z|([+-])(\d\d)(:)?(\d\d))/;
			var ymd = /(\d\d\d\d)-(\d\d)-(\d\d)/;
			if (dString.toString().match(new RegExp(regexp))) {
				var d = dString.match(new RegExp(regexp));
				var offset = 0;
				
				this.setUTCDate(1);
				this.setUTCFullYear(parseInt(d[1],10));
				this.setUTCMonth(parseInt(d[3],10) - 1);
				this.setUTCDate(parseInt(d[5],10));
				this.setUTCHours(parseInt(d[7],10));
				this.setUTCMinutes(parseInt(d[9],10));
				this.setUTCSeconds(parseInt(d[11],10));
				if (d[12]) 
					this.setUTCMilliseconds(parseFloat(d[12],10) * 1000);
				else 
				this.setUTCMilliseconds(0);
				if (d[13] != 'Z') {
					offset = (d[15] * 60) + parseInt(d[17],10);
					offset *= ((d[14] == '-') ? -1 : 1);
					this.setTime(this.getTime() - offset * 60 * 1000);
				}
			}
			else if(dString.toString().match(new RegExp(ymd))){
				var d = dString.toString().match(new RegExp(ymd));
				{
					this.setDate(parseInt(1));
					this.setFullYear(parseInt(d[1],10));
					this.setMonth(parseInt(d[2],10)-1);
					this.setDate(parseInt(d[3],10));
				}
			}
			else{
				this.setTime(Date.parse(dString));
			}
			return this;
		};

		Date.prototype.nextMonth = nextMonth;
		Date.prototype.prevMonth = prevMonth;
		Date.prototype.startOfDay = startOfDay;
		Date.prototype.endOfDay = endOfDay;
		Date.prototype.ymd = ymd;
		Date.prototype.thTime = thTime;
		Date.prototype.setISO8601 = setISO8601;
	}
	
});