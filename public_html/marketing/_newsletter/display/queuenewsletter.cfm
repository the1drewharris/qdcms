<link rel="stylesheet" href="/css/calendar.css" media="screen" />
<script type="text/javascript" src="/js/calendar.js"></script>

<script type="text/javascript">	
	 window.addEvent('domready', function() 
	 { 
	 	myCal = new Calendar({ senddate: { senddate: 'm/d/Y'}}, { pad: 0 });
	 })
</script>

<table class="datagrid">
<tr class="titlebar"><th>Queue Newsletter to send</th></tr>
<tr><td>
<form id="form" method="post" action="/content/newsletter/actions/queuenewsletter">
<fieldset>
<input type="hidden" name="newsletterid" value="#url.newsletterid#">
<label class="name">Send Date</label><br />
<input id="senddate" name="senddate" value="<cfoutput>#DateFormat(Now(), "mm/dd/yyyy")#</cfoutput>" rel="actual" type="text" />
	<select name="sendhour" rel="actual" id="sendhour">
		<option>01</option>
		<option>02</option>
		<option>03</option>
		<option>04</option>
		<option>05</option>
		<option>06</option>
		<option>07</option>
		<option>08</option>
		<option>09</option>
		<option>10</option>
		<option selected>11</option>
		<option>12</option>
	</select> <input type="text" name="sendminute" size="2" value="59" class="minutes" rel="actual" id="sendminute" />
	<select name="sendampm" rel="actual" id="sendampm">
		<option>AM</option>
		<option selected>PM</option>
	</select><br /><br />
	<label class="name">Select the group to send
		<select name="group">
		<option value="">Select one...</option>
		</select>
	</label>
</fieldset>
<input name="submit" type="submit" value="submit">
</form>
</td></tr>
</table>