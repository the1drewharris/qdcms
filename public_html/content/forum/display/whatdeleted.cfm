<span style="float: left; margin: 10px 0 0 10px;font-style:italic">
	<cfswitch expression="#result#">
		<cfcase value="1">
			The forum has been deleted. So this content won't show up on the website.
		</cfcase>
		<cfcase value="2">
			The Topic has been deleted. So this content won't show up on the website.
		</cfcase>
		<cfcase value="3">
			The Post has been deleted. So this content won't show up on the website.
		</cfcase>
		<cfcase value="4">
			The Parent Forum has been deleted. So this content won't show up on the website.
		</cfcase>
	</cfswitch>
</span>