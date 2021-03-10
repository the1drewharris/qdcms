<cfparam name="url.p" default="false">
<cfif url.p>
	<cftransaction>
		<cfinvoke component="#application.objcomments#" method="getComments" ds="#client.siteurl#" returnVariable="myComments" status="Private">
		<cfloop query="myComments">
			<cfif isdefined('form.comment_#commentid#')>
				<cfif Evaluate('form.comment_#commentid#') neq "">
					<cfif Evaluate('form.comment_#commentid#') EQ "approve">
						<cfinvoke component="#application.objcomments#" method="updateComment" returnvariable="myAddComment" ds="#client.siteurl#" commentid="#commentid#" status="Published">
					<cfelseif Evaluate('form.comment_#commentid#') EQ "delete">
						<cfinvoke component="#application.objcomments#" method="deleteComment" returnvariable="myDeleteComment" ds="#client.siteurl#" commentid="#commentid#">
					</cfif>	
				</cfif>
			</cfif>
		</cfloop>
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/content/blog/viewPendBlogComments" addtoken="false">
<cfelse>
	<cfset args=structNew()>
	<cfset args.status = url.s>
	<cfset args.commentid = url.c>
	<cfset args.ds = client.siteurl>
	<cftransaction>
		<cfif args.status EQ "p">
			<cfinvoke component="#application.objcomments#" method="updateComment" argumentcollection="#args#">
			<cfset client.message="The comments have been published">
		<cfelseif args.status EQ "d">
			<cfinvoke component="#application.objcomments#" method="deleteComment" argumentcollection="#args#">
			<cfset client.message="The comment has been deleted">
		</cfif> 
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/content/blog/viewblogComments" addToken="false">
</cfif>