<cfset args=StructNew()>
<cfset args.masterpath="#client.sitepath#/images/">
<cfset args.masterimage=imagefile>
<cfloop from="1" to="#ListLen(application.imagethumbs)#" index="i">
	<cfset args.thumbdir="#args.masterpath##listGetAt(application.imagethumbs,i)#/">
	<cfset args.imageWidth=listGetAt(application.imageThumbWidthList,i)>
	<cfset args.imageHeight=listGetAt(application.imageThumbHeightList,i)>
	<cfinvoke component="#application.objimagegallery#" method="createImageThumb" argumentcollection="#args#">
</cfloop>