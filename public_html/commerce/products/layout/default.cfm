<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<cfoutput>
	<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<cfinclude template="/includes/titleAndMeta.cfm">
			<cfinclude template="/includes/selectivecss.cfm">
		</head>
		<body>
			<cfinclude template="/display/header.cfm">
			<div class="clear"></div>
			<div id="content-bg">
				<div id="content">
					<cfinclude template="../display/submenuNavigation.cfm">
					<cfinclude template="/display/errors.cfm">
					<cfswitch expression="#url.action#">
						<cfcase value="showproducts">
							<cfinclude template="showproducts.cfm">
						</cfcase>
						<cfcase value="showprices">
							<cfinclude template="showprices.cfm">
						</cfcase>
						<cfcase value="showcategories">
							<cfinclude template="showcategories.cfm">
						</cfcase>
						<cfcase value="showentrylog">
							<cfinclude template="showentrylog.cfm">
						</cfcase>
						<cfcase value="showcarts">
							<cfinclude template="showcarts.cfm">
						</cfcase>
						<cfcase value="showcoupons">
							<cfinclude template="showcoupons.cfm">
						</cfcase>
						<cfcase value="couponusage">
							<cfinclude template="showcouponusage.cfm">
						</cfcase>
						<cfcase value="showproductgroups">
							<cfinclude template="showproductgroups.cfm">
						</cfcase>
						<cfcase value="showitems">
							<cfinclude template="showitems.cfm">
						</cfcase>
						<cfcase value="setprice">
							<cfset title="Set Product Price">
							<cfset formaction="actionsetprice">
							<cfinclude template="setprice.cfm">
						</cfcase>
						<cfcase value="addproduct">
							<cfset title="Add Product">
							<cfset formaction="actionaddproduct">
							<cfinclude template="addeditproduct.cfm">
						</cfcase>
						<cfcase value="editproduct">
							<cfset title="Edit Product">
							<cfset formaction="actioneditproduct">
							<cfinclude template="../includes/productinfo.cfm">
							<cfinclude template="addeditproduct.cfm">
						</cfcase>
						<cfcase value="addprice">
							<cfset title="Add Price">
							<cfset formaction="actionaddprice">
							<cfinclude template="addeditprice.cfm">
						</cfcase>
						<cfcase value="editprice">
							<cfset title="Edit Price">
							<cfset formaction="actioneditprice">
							<cfinclude template="../includes/priceinfo.cfm">
							<cfinclude template="addeditprice.cfm">
						</cfcase>
						<cfcase value="addcategory">
							<cfset title="Add Category">
							<cfset formaction="actionaddcategory">
							<cfinclude template="addeditcategory.cfm">
						</cfcase>
						<cfcase value="editcategory">
							<cfset title="Edit Category">
							<cfset formaction="actioneditcategory">
							<cfinclude template="../includes/categoryinfo.cfm">
							<cfinclude template="addeditcategory.cfm">
						</cfcase>
						<cfcase value="editcart">
							<cfinclude template="editcart.cfm">
						</cfcase>
						<cfcase value="addcoupon">
							<cfset title="Add Coupon">
							<cfset formaction="actionaddcoupon">
							<cfinclude template="addeditcoupon.cfm">
						</cfcase>
						<cfcase value="addproductgroup">
							<cfset title="Add Product Group">
							<cfset formaction="actionaddproductgroup">
							<cfinclude template="addeditproductgroup.cfm">
						</cfcase>
						<cfcase value="editproductgroup">
							<cfset title="Edit Product Group">
							<cfset formaction="actioneditproductgroup">
							<cfinclude template="../includes/productgroupinfo.cfm">
							<cfinclude template="addeditproductgroup.cfm">
						</cfcase>
						<cfcase value="additemtoproductgroup">
							<cfset formaction="actionadditemtoproductgroup">
							<cfinclude template="additemtoproductgroup.cfm">
						</cfcase>
						<cfdefaultcase>
							<cflocation url="/cms/commerce/products/showproducts" addtoken="false">
						</cfdefaultcase>
					</cfswitch>
				</div>
			</div>
			<div class="clear"></div>
			<cfinclude template="/display/footer.cfm">
			<cfinclude template="/includes/selectivejs.cfm">
		</body>
	</html>
</cfoutput>