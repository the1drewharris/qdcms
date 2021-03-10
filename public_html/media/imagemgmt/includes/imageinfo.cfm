<cfif NOT thereAreErrors> <!--- thereAreErrors is defined in /display/errors.cfm --->
	<cfinvoke component="#application.objimagegallery#" method="getImage" imagedsn="#client.siteurl#" imageid="#url.i#" returnvariable="imageinfo">
	<cfset Session.formValues['imageid']=imageinfo.imageid>
	<cfset Session.formValues['imagetitle']=imageinfo.title>
	<cfset Session.formValues['imagealt']=imageinfo.alt>
	<cfset Session.formValues['link']=imageinfo.link>
	<cfset Session.formValues['status']=imageinfo.status>
	<cfset Session.formValues['caption']=imageinfo.caption>
	<cfset Session.formValues['imagename']=imageinfo.imagepath>
</cfif>