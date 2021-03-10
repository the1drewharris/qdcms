<cfparam name="form.sendnow" default="0">
<cfparam name="form.testsend" default="0">
<cfset grouplist="">
<cfset excludegrouplist="">
<cfset emailtypelist="hemail,wemail,memail,oemail">
<cfset emailtypes="">
<cfset conditionsMetToPutInQueue=FALSE>
<cfobject component="formvalidation" name="objformvalidation">
<cfinvoke component="#Application.abCFC#" method="searchGroup" contactdsn="#client.siteurl#" returnvariable="myGroups">

<cfset objformvalidation.set_rules('replyto','Reply to','required,email')>
<cfset objformvalidation.set_rules('sendfromname','Send From Name','max_len[64]')>
<cfset objformvalidation.set_rules('name','Newsletter Name','required, max_len[128]')>
<cfset objformvalidation.set_rules('subject','Subject','required,max_len[128]')>
<cfset objformvalidation.set_rules('htmlnewsletter','HTML Newsletter','required')>
<cfset objformvalidation.set_rules('textnewsletter','Text Newsletter','required')>


<cfloop query="myGroups">
	<cfif isDefined('form.group#groupid#_0')>
		<cfset grouplist=listAppend(grouplist,"#groupid#:0")>
	</cfif>
	<cfif isDefined('form.excludegroup#groupid#_0')>
		<cfset excludegrouplist=listAppend(excludegrouplist,'#groupid#:0')>
	</cfif>
	<cfinvoke component="#application.objevent#" method="getEventsContainingGroup" eventdsn="#client.siteurl#" groupid="#groupid#" returnvariable="groupevents">
	<cfif groupevents.recordcount GT 0>
		<cfloop query="groupevents">
			<cfif isDefined('form.group#myGroups.groupid#_#eventid#')>
				<cfset grouplist=listAppend(grouplist,"#myGroups.groupid#:#eventid#")>
			</cfif>
			<cfif isDefined('form.excludegroup#myGroups.groupid#_#eventid#')>
				<cfset excludegrouplist=listAppend(excludegrouplist,"#myGroups.groupid#:#eventid#")>
			</cfif>
		</cfloop>
	</cfif>
</cfloop>

<cfloop list="#emailtypelist#" index="emailtype">
	<cfif isDefined('form.#emailtype#')>
		<cfset emailtypes=ListAppend(emailtypes,emailtype)>
	</cfif>
</cfloop>

<cfif form.testsend NEQ 1>
	<cfif form.sendnow EQ 1 OR Trim(form.senddate) NEQ ''>
		<cfset conditionsMetToPutInQueue=TRUE>
		<cfif listlen(emailtypes) EQ 0>
			<cfset objformvalidation.addError('At least one email type must be selected to send this newsletter')>
		</cfif>
		<cfif listlen(grouplist) EQ 0>
			<cfset objformvalidation.addError('At least one group must be selected to send this newsletter')>
		</cfif>
	</cfif>
</cfif>

<cfif objformvalidation.isValidForm()>
	<cfset thereAreNoErrorsInForm=TRUE>
<cfelse>
	<cfset thereAreNoErrorsInForm=FALSE>
	<cfset client.message="Please correct the following errors">
	<cfset client.errorList=objformValidation.getListOfErrors()>
	<cfloop list="#form.fieldnames#" index="fieldname">
		<cfset Session.formValues['#fieldname#']=form['#fieldname#']>
	</cfloop>
</cfif>