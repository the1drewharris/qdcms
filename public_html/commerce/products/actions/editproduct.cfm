<cfinclude template="validateproductform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfparam name="form.startselling" default="0">
	<cfparam name="form.subscriable" default="0">
	<cfset form.productdsn=client.siteurl>
	<cfif form.startselling EQ 0>
		<cfset form.stopselling=1>
	<cfelse>
		<cfset form.stopselling=0>
	</cfif>
	<cftransaction>
		<cfif Trim(form.image1) NEQ '' OR (form.image2) NEQ '' OR (form.image3) NEQ ''>
			<cfset imagesWereUploaded=TRUE>
			<cfinclude template="uploadimages.cfm"><!--- retuns imagenames, galleryid; --->
		<cfelse>
			<cfset imagesWereUploaded=FALSE>
		</cfif>
		<!--- <cfif listlen(form.categoryid) gt 1>
			<cfset firstCateogryid=listFirst(form.categoryid)>
			<cfset firstCategoryid="#listfirst(form.categoryid)#">
		<cfelse>
			<cfset firstCategoryid=arguments.categoryid>
		</cfif>
		<cfoutput>
		#firstCategoryid#
		</cfoutput> --->
		<!--- <cfabort> --->
		<cfinvoke component="#application.objproduct#" method="editproduct" argumentcollection="#form#">
		<cfinvoke component="#application.objproduct#" method="getPricenames" productdsn="#client.siteurl#" returnvariable="pricenames">
		<!---loop over the prices for this product and add/update them--->
		<cfset form.pricenameid=0>
		<cfset form.price=0>
		<cfloop query="pricenames">
			<cfset form.pricenameid=pricenameid>
			<cfset form.price=form["priceid:"& pricenameid]>
			<cfinvoke component="#application.objproduct#" method="setprice" argumentcollection="#form#">
		</cfloop>
		<cfif imagesWereUploaded>
			<cfloop list="#imagenames#" index="imagename">
				<cfset imageid=application.objimagegallery.addImage(client.siteurl,imagename)>
				<cfset application.objimagegallery.addImageToGallery(client.siteurl,imageid,galleryid)>
				<cfset application.objproduct.addimagetoproduct(client.siteurl,id,imageid)>
			</cfloop>
		</cfif>
	</cftransaction>
	<cfinclude template="/actions/tracking.cfm">
	<cflocation url="/cms/#url.section#/#url.module#/showproducts" addtoken="false">
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#" addtoken="false">
</cfif>