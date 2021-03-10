<cfparam name="url.p" default="0">
<cfparam name="url.i" default="0">
<cfif IsNumeric(url.p)>
	<cfif url.p GT 0>
		<cfif IsNumeric(url.i)>
			<cfif url.i GT 0>
				<cftransaction>
					<cfset application.objforum.removeImage(client.siteurl,url.p,url.i)>
				</cftransaction>
				<cfset client.message="Image removed from the post">
			</cfif>
		</cfif>
	</cfif>
</cfif>
<cfset client.message="Image removed from the post">
