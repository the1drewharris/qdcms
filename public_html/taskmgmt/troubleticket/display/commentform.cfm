<cfoutput>
	<form method="post" action="/cms/taskmgmt/troubleticket/actionaddcomment">
		<input type="hidden" name="incidentid" value="#url.incidentid#">
		<b>Comment</b><br />
		<textarea name="comment"  rows="5" cols="43"></textarea><br /> <br />
		<label class="checkbox">
			<input type="checkbox" name="solution">Flag this as solution 
		</label>
		<input type="submit" name="submit" value="submit">
	</form>
</cfoutput>