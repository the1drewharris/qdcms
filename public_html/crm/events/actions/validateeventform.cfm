<cfobject component="formValidation" name="objFormValidation">
<cfset objFormValidation.set_rules('eventname','Event Name','required,min_len[2],max_len[128]')>
<cfset objFormValidation.set_rules('eventcategoryid','Event Category','required')>
<cfset objFormValidation.set_rules('status','Status','required')>
<cfif form.allday EQ 1>
	<cfset objformValidation.set_rules('alldaydate','All day date','required,date')>
<cfelse>
	<cfset objformValidation.set_rules('startdate','Start Date','required,date')>
	<cfset objformValidation.set_rules('enddate','End Date','required,date')>
</cfif>

<cfset objformValidation.set_rules('repeat','Repeat','required')>

<cfif form.repeat NEQ "None">
	<cfif Trim(form.repeatAfter) NEQ "">
		<cfset objformValidation.set_rules('repeatAfter','No of Times','required,numeric')>
	<cfelseif Trim(form.repeatDate) NEQ "">
		<cfset objformValidation.set_rules('repeatDate','Repeat','required,date')>
	<cfelse>
		<cfset objformValidation.addError('Either <i>No of Times</i> or <i>Repeat End Date</i> is required when <i>Repeat</i> is not <i>None</i>')>
	</cfif>
</cfif>

<!--- Email part --->
<cfset objformValidation.set_rules('eventurl','Web Address','max_len[256]')>
<cfset objformValidation.set_rules('fromEmail','fromEmail','email')>
<cfset objformValidation.set_rules('cc','cc','email')>
<cfset objformValidation.set_rules('subject','subject','max_len[256]')>

<!--- pricing and registration part --->
<cfset objformValidation.set_rules('defaultprice','Default Price','numeric,max_value[100000]')>
<cfset objformValidation.set_rules('guestprice','Guest Price','numeric,max_value[100000]')>
<cfset objformValidation.set_rules('percentoff','percent Off','numeric,min_value[0],max_value[100]')>
<cfset objformValidation.set_rules('regstartdate','Registration start date','date')>
<cfset objformValidation.set_rules('regenddate','Registration end date','date')>

<!--- Location part --->
<cfset newLocation=FALSE>
<cfset updateLocation=FALSE>
<cfif form.locationType EQ "New">
	<cfset objformValidation.set_rules('locationname','Location Name','required,max_len[256]')>
	<cfset objformValidation.set_rules('locationemail','Location Email','email')>
	<cfset objformValidation.set_rules('locationphone','Location Phone','phone')>
	<cfset objformValidation.set_rules('locationaddress1','Location Address Line 1','required,max_len[128]')>
	<cfset objformValidation.set_rules('locationaddress2','Location Address Line 2','max_len[128]')>
	<cfset objformValidation.set_rules('locationcity','Location City','required,max_len[64]')>
	<cfset objformValidation.set_rules('locationstate','Location State','required')>
	<cfset objformValidation.set_rules('locationzip','Location zip','required,zip')>
	<cfset newLocation=TRUE>
<cfelseif form.locationType EQ "None">
	<cfset locationid=0>
<cfelse>
	<cfset locationid=form.locationType>
	<cfset updateLocation=TRUE>
</cfif>

<!--- contact part --->
<cfset newContact=FALSE>
<cfset updateContact=FALSE>
<cfif form.contactType EQ "New">
	<cfset objformValidation.set_rules('contactfirstname','First Name','required,max_len[32]')>
	<cfset objformValidation.set_rules('contactlastname','Last Name','required,max_len[32]')>
	<cfset objformValidation.set_rules('contactphone','Phone','phone')>
	<cfset objformValidation.set_rules('contactemail','Contact Email','required,email')>
	<cfset objformValidation.set_rules('contactaddress1','Address Line 1','max_len[128]')>
	<cfset objformValidation.set_rules('contactaddress2','Address Line 2','max_len[128]')>
	<cfset objformValidation.set_rules('contactcity','City','max_len[64]')>
	<cfset objformValidation.set_rules('contactstate','State','max_len[32]')>
	<cfset objformValidation.set_rules('contactzip','zip','zip')>
	<cfset newcontact=TRUE>
<cfelseif form.contactType EQ "None">
	<cfset contactid=0>
<cfelse>
	<cfset contactid=form.contactType>
	<cfset updateContact=TRUE>
</cfif>

<cfinclude template="/actions/checkforerrorsinform.cfm">