<cfset args=structNew()>
<cfset args.masterpath="#path#/images/">
<cfset thumbDirList="qdcms,tiny,small,large,detail">
<cfset masterpath="#path#/images">
<cfset j=1>
<cfloop list="#thumbDirList#" index="thumbDir">
	<cfset args.masterimage=masterimage>
	<cfset args.thumbdir="#path#/images/#thumbDir#/">
	<cfset args.imageWidth=listGetAt(Application.imageThumbWidthlist,j)>
	<cfset args.imageHeight=listGetAt(Application.imageThumbHeightlist,j)>
	<cfinvoke component="#application.objimagegallery#" method="createImageThumb" argumentcollection="#args#">
	<cfset j=j+1>
</cfloop>