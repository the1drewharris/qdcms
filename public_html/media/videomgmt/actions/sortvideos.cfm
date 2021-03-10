<cfset args=StructNew()>
<cfset args.videodsn=client.siteurl>
<cfset args.videocategoryid=form.g>
<cfset args.sortlist=form.so>
<cftransaction>
	<cfinvoke component="#application.objvideolib#" method="sortVideosInGallery" argumentcollection="#args#">
</cftransaction>
<cfinclude template="/actions/tracking.cfm">