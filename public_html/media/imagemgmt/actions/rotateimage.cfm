<cfinvoke component="#application.objimagegallery#" method="rotateThisImage" imagedsn="#client.siteurl#" imageid="#form.imageid#" angle="#form.a#" sitepath="#client.sitepath#" returnvariable="imagepath">
<cfinclude template="/actions/tracking.cfm">
<cfimage action="read" name="imagepreview" source="#client.imagepath#/qdcms/#imagepath#">
<cfxml variable="imagexml">
	<cfimage action="writetobrowser" source="#imagepreview#">
</cfxml>
<cfoutput>#form.imageid#,#imagexml.xmlRoot.xmlAttributes.src#</cfoutput>