<!--- 
	The code seems akward but product name is unique 
--->
<cfparam name="form.subscriable" default="0">
<cfparam name="form.startselling" default="0">
<cfparam name="form.categoryid" default="">	
<cfset imagesWereUploaded=FALSE>
<cfinclude template="validateproductform.cfm">
<cfif thereAreNoErrorsInForm>
	<cfset form.productdsn=client.siteurl>
	<cfset form.nameid=client.masternameid>
	<cfset form.idfor="Product">
	
	<cfif Trim(form.image1) NEQ '' OR (form.image2) NEQ '' OR (form.image3) NEQ ''>
		<cfset imagesWereUploaded=TRUE>
		<cfinclude template="uploadimages.cfm"><!--- retuns imagenames, galleryid; --->
	</cfif>
	
	<cfinvoke component="#application.objproduct#" method="getIdFromItemName" argumentcollection="#form#" returnvariable="id">
	<cftransaction>
		<cfif id EQ 0>
			<cfinvoke component="#application.objproduct#" method="createID" argumentcollection="#form#" returnvariable="id">
			<cfset itIsAnewProduct=TRUE>
		<cfelse>
			<cfset itIsAnewProduct=FALSE>
		</cfif>
		
		<cfset form.id=id>
		<cfif itIsAnewProduct>
			<cfinvoke component="#application.objproduct#" method="addproduct" argumentcollection="#form#">
		<cfelse>
			<cfinvoke component="#application.objproduct#" method="addExistingProduct" argumentcollection="#form#">
		</cfif>
		
		<cfinvoke component="#application.objproduct#" method="getPricenames" productdsn="#client.siteurl#" returnvariable="pricenames">
		<!---loop over the prices for this product and add/update them--->
		<cfset form.pricenameid=0>
		<cfset form.price=0>
		<cfloop query="pricenames">
			<cfset form.pricenameid=pricenameid>
			<cfset form.price=form["priceid:"& pricenameid]>
			<cfinvoke component="#application.objproduct#" method="setprice" argumentcollection="#form#">
		</cfloop>
		
		<!--- <cfinvoke component="#application.objproduct#" method="logproductadd" argumentcollection="#form#"> --->
		
		<cfif imagesWereUploaded>
			<cfloop list="#imagenames#" index="imagename">
				<cfset imageid=application.objimagegallery.addImage(client.siteurl,imagename,form.itemname)>
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