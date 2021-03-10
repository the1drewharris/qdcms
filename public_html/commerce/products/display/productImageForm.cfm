<cfparam name="attributes.nextimagebox" default="1">
<cfparam name="attributes.max" default="3">
<cfif attributes.nextimagebox LTE attributes.max>
	<cfoutput>
		<div class="clear"><br /></div>
		<span class="justLabel">Accepted image types(gif,jpg,jpeg,png)</span>
		<div class="clear"><br /></div>
		<cfloop from="#attributes.nextimagebox#" to="#attributes.max#" index="i">
			<span class="justLabel">Image #i#</span>
			<input type="file" name="image#i#" size="20">
			<div class="clear"><br /></div>
		</cfloop>
	</cfoutput>
</cfif>