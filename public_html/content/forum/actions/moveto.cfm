<cfparam name="client.pagetogo" default="0">
<cfset args=StructNew()>
<cfset args.ds=client.siteurl>
<cfswitch expression="#url.action#">
	<cfcase value="movetoforum">
		<cfset args.forumlist=client.forumList>
		<cfif isDefined('form.forumid')>
			<cfset args.newparentid=form.forumid>
		<cfelse>
			<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
		</cfif>
		<cftransaction>
			<cfinvoke component="#application.objforum#" method="moveforums" argumentcollection="#args#">
		</cftransaction>
		<cfset structdelete(client,'forumlist',FALSE)>
	</cfcase>
	<cfcase value="movetopicstoforum">
		<cfset args.topicList=client.topicList>
		<cfif isDefined('form.forumid')>
			<cfset args.forumid=form.forumid>
		<cfelse>
			<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
		</cfif>
		<cftransaction>
			<cfinvoke component="#application.objforum#" method="moveTopics" argumentcollection="#args#">
		</cftransaction>
		<cfset structDelete(client,'topicList',FALSE)>
	</cfcase>
	<cfcase value="movepoststotopic">
		<cfset args.postList=client.postList>
		<cfif isDefined('form.topicid')>
			<cfset args.newtopicid=form.topicid>
		<cfelse>
			<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
		</cfif>
		<cftransaction>
			<cfinvoke component="#application.objforum#" method="moveposts" argumentcollection="#args#">
		</cftransaction>
		<cfset structDelete(client,'postList',FALSE)>
	</cfcase>
</cfswitch>
<cfinclude template="/actions/tracking.cfm">

<cfif client.pagetogo EQ "0">
	<cflocation url="/cms/content/forum/showforums" addtoken="false">
<cfelse>
	<cfset pagetogo=client.pagetogo>
	<cfset client.pagetogo="0">
	<cflocation url="#pagetogo#" addtoken="false">
</cfif>