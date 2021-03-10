<cfif NOT thereAreErrors> <!--- thereAreErrors is defined in /display/errors.cfm --->
	<cfinvoke component="#application.objproduct#" method="getProduct" productdsn="#client.siteurl#" id="#url.id#" returnvariable="thisProduct">
	<cfinvoke component="#application.objproduct#" method="getPricenames" productdsn="#client.siteurl#" returnvariable="allPrices">
	<cfif thisProduct.recordcount GTE 0>
		<cfset Session.formValues['id']=thisProduct.id>
		<cfset Session.formValues['itemname']=thisProduct.itemname>
		<cfset Session.formValues['quantity']=thisProduct.quantity>
		<cfset Session.formValues['categoryid']=thisProduct.categoryid>
		<cfset Session.formValues['description']=thisProduct.description>
		<cfset Session.formValues['attributes']=thisProduct.attributes>
		<cfset Session.formValues['subscriable']=thisProduct.subscriable>
		<cfset Session.formValues['TEASER']=thisProduct.TEASER>
		<cfset Session.formValues['WEIGHT']=thisProduct.WEIGHT>
		<cfset Session.formValues['CLIENTPRODUCTID']=thisProduct.CLIENTPRODUCTID>
		<cfif client.siteurl eq "vcientertainment.com">
			<cfset Session.formValues['color']=thisProduct.color>
			<cfset Session.formValues['rating']=thisProduct.rating>
			<cfset Session.formValues['format']=thisProduct.format>
			<cfset Session.formValues['prodyear']=thisProduct.prodyear>
			<cfset Session.formValues['netflixid']=thisProduct.netflixid>
			<cfset Session.formValues['brightcovetrailerid']=thisProduct.brightcovetrailerid>
		</cfif>
		
		<cfif thisProduct.stopselling EQ 0>
			<cfset Session.formValues['startselling']=1>
		</cfif>
		<cfif allprices.recordcount GT 0>
			<cfloop query="allprices">
				<cfinvoke component="#application.objproduct#" method="getPrices" productdsn="#client.siteurl#" id="#url.id#" pricename="#pricename#" returnvariable="thisProductPrice">
				<cfset Session.formValues['#pricename#']=thisproductprice.price>
			</cfloop>
		</cfif>
		<cfinvoke component="#application.objproduct#" method="getproductimages" productdsn="#client.siteurl#" productid="#url.id#" returnvariable="productimageids">
		<cfset Session.formValues['productimageids']=productimageids>
	<cfelse>
		<cflocation url="/cms/commerce/product/showproducts" addtoken="false">
	</cfif>
</cfif>