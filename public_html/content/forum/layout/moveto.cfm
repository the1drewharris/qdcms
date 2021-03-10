<cfparam name="url.selection" default="forums">

<cfset args=structNew()>
<cfset args.ds=client.siteurl>

<cfswitch expression="#url.action#">
	<cfcase value="moveforums">
		<h3>Move Selected Forums To</h3>
		<cfset client.forumlist=url.forumList>
		<cfset args.excludelist=url.forumList>
		<form method="post" action="/cms/content/forum/movetoforum">
		<cfinvoke component="#application.objforum#" method="geteligibleParents" argumentcollection="#args#" returnvariable="forums">
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th class="radio">Select</th>
				<th>Name</th>
				<th>Description</th>
			</tr>
			<cfoutput query="forums">
			<cfif currentRow MOD 2 EQ 0><tr class="alt"><cfelse><tr></cfif>
				<td><input name="forumid" type="radio" value="#forumid#"/></td>
				<td> #name#</td>
				<td>#description#</td>
			</tr>
			</cfoutput>
		</table>
		<input type="Submit" value="Submit"> 
		</form>
	</cfcase>
	<cfcase value="moveTopics">
		<cfset client.topiclist=url.topiclist>
		<cfset args.choice=1>
		<form method="post" action="/cms/content/forum/movetopicstoforum">
		<cfinvoke component="#application.objforum#" method="getforums" argumentcollection="#args#" returnvariable="forums">
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th class="radio">Select</th>
				<th>Name</th>
				<th>Description</th>
			</tr>
			<cfoutput query="forums">
			<cfif currentRow MOD 2 EQ 0><tr class="alt"><cfelse><tr></cfif>
				<td><input name="forumid" type="radio" value="#forumid#"/></td>
				<td>#name#</td>
				<td>#description#</td>
			</tr>
			</cfoutput>
		</table> 
		<input type="Submit" value="Submit"> 
		</form>
	</cfcase>
	<cfcase value="moveposts">
		<cfswitch expression="#url.selection#">
			<cfcase value="forums">
				<h3>Select Forum</h3>
				<cfset client.postlist=url.postlist>
				<cfset args.choice=1>
				<form method="post" action="/cms/content/forum/movePosts/?selection=topics">
				<cfinvoke component="#application.objforum#" method="getforums" argumentcollection="#args#" returnvariable="forums">
				<table class="datagrid" id="managePagesTable">
					<tr class="titlebar">
						<th class="radio">Select</th>
						<th>Name</th>
						<th>Description</th>
					</tr>
					<cfoutput query="forums">
					<cfif currentRow MOD 2 EQ 0><tr class="alt"><cfelse><tr></cfif>
						<td><input name="forumid" type="radio" value="#forumid#"/></td>
						<td> #name#</td>
						<td>#description#</td>
					</tr>
					</cfoutput>
				</table> 
				<input type="Submit" value="Next"> 
				</form>	
			</cfcase>
			<cfcase value="topics">
				<h3>Select Topic</h3>
				<form method="post" action="/cms/content/forum/movepoststotopic">
					<cfif isDefined('form.forumid')>
						<cfset args.forumid=form.forumid>
					<cfelse>
						<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
					</cfif>
					<cfinvoke component="#application.objforum#" method="gettopics" argumentcollection="#args#" returnvariable="topics">
					<table class="datagrid" id="managePagesTable">
						<tr class="titlebar">
							<th class="radio">Select</th>
							<th>Topic Title</th>
						</tr>
						<cfoutput query="topics">
						<cfif currentRow MOD 2 EQ 0><tr class="alt"><cfelse><tr></cfif>
							<td><input name="topicid" type="radio" value="#topicid#"/></td>
							<td>#topictitle#</td>
						</tr>
						</cfoutput>
					</table> 
					<input type="Submit" value="Submit">
				</form>
			</cfcase>
		</cfswitch>
	</cfcase>
</cfswitch>