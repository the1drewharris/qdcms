<cfset objformvalidation.set_rules("topictitle","Topic Title","required")>
<cfif objformvalidation.isvalidform()>
	<cfset args=structNew()>
	<cfset args.ds=client.siteurl>
	<cfset args.topicid=form.topicid>
	<cfset args.topictitle=form.topictitle>
	<cftransaction>
		<cfinvoke component="#application.objforum#" method="edittopic" argumentcollection="#args#">
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/content/forum/showtopics/?f=#form.forumid#&s=#form.s#" addtoken="false">
</cfif>