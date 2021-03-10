<cfobject component="formvalidation" name="objformvalidation">
<cfparam name="url.s" default="0">

<cfif isDefined('form.submit')>
	<cfinclude template="/content/forum/actions/editTopic.cfm">
<cfelse>
	<cfinvoke component="#application.objforum#" method="gettopics" ds="#client.siteurl#" topicid="#url.t#" deleted="-1" returnvariable="thistopic">
	<cfset form.topictitle=thistopic.topictitle>
	<cfset form.topicid=thistopic.topicid>
	<cfset form.forumid=thistopic.forumid>
	<cfif not isDefined('form.s')>
		<cfset form.s=url.s>
	</cfif>
</cfif>

<h3>Edit Topic Title</h3>
<cfoutput>#objformvalidation.validation_errors()#
<form id="postform" method="post" action="/cms/content/forum/edittopic">
	<input type="hidden" name="topicid" value="#objformvalidation.set_value('topicid')#">
	<input type="hidden" name="forumid" value="#objformvalidation.set_value('forumid')#">
	<input type="hidden" name="s" value="#objformvalidation.set_value('s')#">
	<label for="topictitle">Topic Title</label>
	<input type="text" id="topictitle" style="width: 575px;" name="topictitle" value="#Xmlformat(objformvalidation.set_value('topictitle'))#" />	
	<div style="padding:5px"></div>
	<input type="submit" class="btnSubmit" name="submit" value="Submit">
</form>
</cfoutput>

