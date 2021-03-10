<cfswitch expression="#url.action#">
	<cfcase value="restoreforums">
		<cfif isDefined('url.forumList') AND len(url.forumList)>
			<cfset args=structNew()>
			<cfset args.ds=client.siteurl>
			<cfset args.forumList=url.forumList>
			<cftransaction>
				<cfinvoke component="#application.objforum#" method="UndeleteForum" argumentcollection="#args#">
			</cftransaction>
			<cfinclude template="/actions/tracking.cfm">
		</cfif>
		<cflocation url="/cms/content/forum/DeletedForums" addtoken="false">
	</cfcase>
	<cfcase value="restoretopics">
		<cfif isDefined('url.topicList') AND len(url.topicList)>
			<cfset args=structNew()>
			<cfset args.ds=client.siteurl>
			<cfset args.topicList=url.topicList>
			<cftransaction>
				<cfinvoke component="#application.objforum#" method="UndeleteTopics" argumentcollection="#args#">
			</cftransaction>
			<cfinclude template="/actions/tracking.cfm">
		</cfif>
		<cflocation url="/cms/content/forum/deletedTopics" addtoken="false">
	</cfcase>
	<cfcase value="restoreposts">
		<cfif isDefined('url.postList') AND len(url.postList)>
			<cfset args=structNew()>
			<cfset args.ds=client.siteurl>
			<cfset args.postList=url.postList>
			<cftransaction>
				<cfinvoke component="#application.objforum#" method="UndeletePosts" argumentcollection="#args#">
			</cftransaction>
			<cfinclude template="/actions/tracking.cfm">
		</cfif>
		<cflocation url="/cms/content/forum/deletedposts" addtoken="false">
	</cfcase>
</cfswitch>