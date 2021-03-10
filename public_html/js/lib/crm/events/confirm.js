function confirmdelete(eventid)
{
	var confirmation='Are you sure you want to delete all instances of this event?'
	var sure=confirm(confirmation);
	if(sure)
	{
		location.href='/cms/crm/events/deleteevent?eventid=' + eventid;
	}
}

function confirmdeleteinstance(instanceid)
{
	var confirmation='Are you sure you want to delete this instance of the event?'
	var sure=confirm(confirmation);
	if(sure)
	{
		location.href='/cms/crm/events/deleteevent?instanceid=' + instanceid;
	}
}