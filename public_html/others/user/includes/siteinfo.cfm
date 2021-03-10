<cfif NOT thereAreErrors>
	<cfoutput>
		<cfinvoke component="#application.objsite#" method="getSiteInfo" siteid="#url.s#" returnvariable="siteInfo">
		<cfinvoke component="#application.objqdsecurity#" method="getModulesInSite" siteid="#siteInfo.siteid#" returnvariable="sitemodules">
		<cfset session.formValues['siteid']=siteinfo.siteid>
		<cfset session.formValues['sitename']=siteinfo.sitename>
		<cfset session.formValues['scity']=siteinfo.scity>
		<cfset session.formValues['sstate']=siteinfo.sstate>
		<cfset session.formValues['orgname']=siteinfo.orgname>
		<cfset session.formValues['sitetitle']=siteinfo.sitetitle>
		<cfset session.formValues['subtitle']=siteinfo.subtitle>
		<cfset session.formValues['siteurl']=siteinfo.siteurl>
		<cfset session.formValues['sitekeywords']=siteinfo.sitekeywords>
		<cfset session.formValues['sitedescription']=siteinfo.sitedescription>
		<cfset session.formValues['orgphone']=siteinfo.orgphone>
		<cfset session.formValues['defaultareacode']=siteinfo.defaultareacode>
		<cfset session.formValues['commentemail']=siteinfo.commentemail>
		<cfset session.formValues['cc_commentemail']=siteinfo.cc_commentemail>
		<cfset session.formValues['altnamedb']=siteinfo.altnamedb>
		<cfset session.formValues['parentid']=siteinfo.parentid>
		<cfset session.formValues['clientsiteid']=siteinfo.clientsiteid>
		<cfset session.formValues['layoutid']=siteinfo.layoutid>
		<cfset session.formValues['colorschemeid']=siteinfo.colorschemeid>
		<cfset session.formValues['formfamilyid']=siteinfo.fontfamilyid>
		<cfset session.formValues['gallerythumbstyle']=siteinfo.gallerythumbstyle>
		<cfset session.formValues['imagesthumbstyle']=siteinfo.imagesthumbstyle>
		<cfset session.formValues['imagesperrow']=siteinfo.imagesperrow>
		<cfset session.formValues['imagesperpage']=siteinfo.imagesperpage>
		<cfset session.formValues['addressneeded']=siteinfo.addressneeded>
		<cfset session.formValues['passwordneeded']=siteinfo.passwordneeded>
		<cfset session.formValues['phoneneeded']=siteinfo.phoneneeded>
		<cfset session.formValues['showthemepicker']=siteinfo.showthemepicker>
		<cfloop query="siteModules">
			<cfset session.formValues['module#moduleid#']=moduleid>
		</cfloop>
	</cfoutput>
</cfif>