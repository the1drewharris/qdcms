<cfset formIsValid=FALSE>
<cfset client.errorList="">
<cfif url.action EQ "edituseraction">
	<cfset mynameid=form.nameid>
<cfelse>
	<cfset mynameid=0>
</cfif>
<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('firstname','First Name','required,max_len[32]')>
<cfset objformvalidation.set_rules('lastname','Last Name','required,max_len[32]')>
<cfset objformvalidation.set_rules('wemail','Email','max_len[34]')>
<!---
<cfif objformvalidation.validation_error('wemail') EQ "">
	<cfinvoke component="#application.abCFC#" method="searchemail" contactdsn="#application.masterdsn#" email="#form.wemail#" nameid="#mynameid#" returnvariable="emailsearchresult">
	<cfif emailsearchresult.recordcount GT 0>
		<cfset objformvalidation.adderror('Email already exists. Please select different email.')>
	</cfif>
</cfif>
--->
<cfset objformvalidation.set_rules('company','Company','max_len[256]')>
<cfset objformvalidation.set_rules('title','Title','max_len[64]')>
<cfset objformvalidation.set_rules('myusername','Username','required,min_len[3],max_len[60]')>
<cfif objformvalidation.validation_error('myusername') EQ "">
	<cfinvoke component="#application.abCFC#" method="checkusername" contactdsn="#application.masterdsn#" myusername="#form.myusername#" nameid="#mynameid#" returnvariable="result">
	<cfif result EQ 1>
		<cfset objformvalidation.adderror('Username already exists. Please select different username')>
	</cfif>
</cfif>
<cfset objformvalidation.set_rules('mypassword','Password','required,min_len[6],max_len[32]')>
<cfset objformvalidation.set_rules('confirm','Confirm Password','matches[mypassword]')>
<cfset objformvalidation.set_rules('address1','Address Line 1','required,max_len[128]')>
<cfset objformvalidation.set_rules('address2','Address Line 2','max_len[128]')>
<cfset objformvalidation.set_rules('city','City','required,max_len[64]')>
<cfset objformvalidation.set_rules('state','state','required')>
<cfset objformvalidation.set_rules('zip','Zip','required,zip')>
<cfset objformvalidation.set_rules('hphone','Home Phone','required,phone')>
<cfset objformvalidation.set_rules('wphone','Work Phone','phone')>
<cfset objformvalidation.set_rules('mphone','Cell Phone','phone')>
<cfset sitesSelected="">

<cfloop query="Session.sites">
	<cfif isDefined('form.siteid#siteid#')>
		<cfset sitesSelected=listAppend(sitesSelected,siteid)>
	</cfif>
</cfloop>
<cfif sitesSelected EQ "">
	<cfset objformValidation.adderror('You have to select at least one site')>
</cfif>
<cfif NOT objformvalidation.isValidForm()>
	<cfset client.message="Please correct the following errors">
	<cfset client.errorList=objformvalidation.getListOfErrors()>
	<cfloop list="#form.fieldnames#" index="fieldname">
		<cfset session.formValues['#fieldname#']=form['#fieldname#']>
	</cfloop>
<cfelse>
	<cfset formIsValid=TRUE>
</cfif>