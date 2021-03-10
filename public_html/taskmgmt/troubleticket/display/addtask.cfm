<cfset taskname="Task_#incident.incidentname#">
<cfoutput>
	<form method="post" action="/cms/taskmgmt/troubleticket/actionaddtaskfromincident">
		<fieldset>
			<input type="hidden" name="incidentid" value="#url.incidentid#">
			
			<label class="name">Task <br />
				<input type="textarea" name="tname" value="#taskname#">
			</label>
			
			<label class="name">Task Description<br />
				<textarea name="task_description" rows="5" cols="70"></textarea>
			</label>
			
			<label class="name">Task Type: Incident</label>
			<input type="hidden" name="task_type" value="Incident">
			
			<label class="name">Fee<br />
				<input type="textarea" name="fee" value="0">
			</label>
			
			<label class="name">Estimated Minutes<br />
				<input type="textarea" name="est_mins" value="0">
			</label>
		</fieldset>
		<input type="submit" name="submit" value="submit">
	</form>
</cfoutput>