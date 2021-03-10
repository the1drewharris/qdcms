<cfswitch expression="#url.action#">
	<cfcase value="actionaddproduct">
		<cfset request.stream="added a product">
		<cfinclude template="actions/addproduct.cfm">
	</cfcase>
	<cfcase value="actioneditproduct">
		<cfset request.stream="edited a product">
		<cfinclude template="actions/editproduct.cfm">
	</cfcase>
	<cfcase value="actionaddprice">
		<cfset request.stream="added a price">
		<cfinclude template="actions/addprice.cfm">
	</cfcase>
	<cfcase value="actioneditprice">
		<cfset request.stream="edited a price">
		<cfinclude template="actions/editprice.cfm">
	</cfcase>
	<cfcase value="actionsetprice">
		<cfset request.stream="set a price">
		<cfinclude template="actions/setprice.cfm">
	</cfcase>
	<cfcase value="actionaddcategory">
		<cfset request.stream="added a category">
		<cfinclude template="actions/addcategory.cfm">
	</cfcase>
	<cfcase value="actioneditcategory">
		<cfset request.stream="edited a category">
		<cfinclude template="actions/editcategory.cfm">
	</cfcase>
	<cfcase value="actionaddproductgroup">
		<cfset request.stream="added a product group">
		<cfinclude template="actions/addproductgroup.cfm">
	</cfcase>
	<cfcase value="actioneditproductgroup">
		<cfset request.stream="edited a product group">
		<cfinclude template="actions/editproductgroup.cfm">
	</cfcase>
	<cfcase value="actionremoveitem">
		<cfset request.stream="removed an item from a product group">
		<cfinclude template="actions/removeitem.cfm">
	</cfcase>
	<cfcase value="actionadditemtoproductgroup">
		<cfset request.stream="added an item to a product group">
		<cfinclude template="actions/additemtoproductgroup.cfm">
	</cfcase>
	<cfcase value="actionaddcoupon">
		<cfset request.stream="added a product">
		<cfinclude template="actions/addcoupon.cfm">
	</cfcase>
	<cfcase value="removeitemfromcart">
		<cfset request.stream="removed an item from a cart">
		<cfinclude template="actions/removeitemfromcart.cfm">
	</cfcase>
	<cfcase value="addtocart">
		<cfset request.stream="added an item to a cart">
		<cfinclude template="actions/addtocart.cfm">
	</cfcase>
	<cfcase value="updatequantity">
		<cfset request.stream="updated the quanity of a cart">
		<cfinclude template="actions/updatequantity.cfm">
	</cfcase>
	<cfcase value="completetransaction">
		<cfset request.stream="completed a cart transaction">
		<cfinclude template="actions/completetransaction.cfm">
	</cfcase>
	<cfcase value="additionalinfo">
		<cfset request.stream="added additional information">
		<cfinclude template="display/additionalinfo.cfm">
	</cfcase>
	<cfcase value="showallprices">
		<cfset request.stream="viewed all prices for a product">
		<cfinclude template="display/showallprices.cfm">
	</cfcase>
	<cfcase value="actionsortimages">
		<!--- it does nothing right now--->
		<cfinclude template="actions/sortImages.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfset request.stream=0>
		<cfinclude template="layout/default.cfm">
	</cfdefaultcase>
</cfswitch>