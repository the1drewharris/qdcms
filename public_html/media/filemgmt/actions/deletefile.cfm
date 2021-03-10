<cfparam name="url.filelist" default="0">
<cfif url.filelist NEQ 0>
	<cftransaction>
		<cfloop list="#url.filelist#" index="fileid">
			<cfset args = StructNew()>
			<cfset args.filedsn=client.siteurl>
			<cfset args.fileid=fileid>
			<cfinvoke component="#application.objfile#" method="deletenonmediafile" argumentcollection="#args#">
		</cfloop>
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
</cfif>
<cflocation url="/cms/media/filemgmt/showfiles" addtoken="false">