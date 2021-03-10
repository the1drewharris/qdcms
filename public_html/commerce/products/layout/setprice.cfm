<cfoutput>
	<cfparam name="url.p" default="0">
	<cfinvoke component="#application.objproduct#" method="getproductsandgroups" productdsn="#client.siteurl#" returnvariable="products">
	<cfinvoke component="#application.objproduct#" method="getPricenames" productdsn="#client.siteurl#" returnvariable="prices">
	<cfset thereAreProductsAndPriceNames=TRUE>
	<cfset thereAreNoProducts=FALSE>
	<cfset thereAreNoPriceNames=FALSE>
	
	<cfif products.recordcount EQ 0>
		<cfset thereAreNoProducts=TRUE>
		<cfset thereAreProductsAndPriceNames=FALSE>
	</cfif>
	<cfif prices.recordcount EQ 0>
		<cfset thereAreNoPriceNames=TRUE>
		<cfset thereAreProductsAndPriceNames=FALSE>
	</cfif>
	<cfif thereAreProductsAndPriceNames>
		<cfif url.p EQ 0><cfset url.p=products.id></cfif>
		<h1>#title#</h1>
		<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post">
			<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
			  	<tr>
					<td class="mainWebPageInfo">
						<fieldset>
							<label class="name">Product Name
					    		<select name="id" onkeyup ="showPrices(this.value)" onclick="showPrices(this.value)">
									<cfloop query="products">
										<option value="#id#" <cfif url.p EQ id>Selected</cfif>>#itemname#</option>
									</cfloop>
								</select>
							</label>
							<label class="name">Price Name
								<select name="pricenameid">
									<cfloop query="prices">
										<option value="#pricenameid#">#pricename#</option>
									</cfloop>
								</select>
							</label>
							<label class="name">Price
								<input type="text" name="price">
							</label>
						</fieldset>
					</td>
					<td class="quickWebPageInfo">
						<div class="container" id="price-container">
							<cfinclude template="../display/showallprices.cfm">
						</div>
					</td>
			 	</tr>
			 	<tr>
			   		<td colspan="2">
						<input type="submit" name="Submit" value="Submit" >
					</td>
			 	</tr>
			</table>
		</form>
	<cfelse>
		<cfset client.message="Please correct the following errors">
		<cfif thereAreNoProducts>
			<cfset client.errorlist=listAppend(client.errorlist,"There are no products to set price")>
		</cfif>
		<cfif thereAreNoPriceNames>
			<cfset client.errorlist=listAppend(client.errorlist,"There are no prices types set to set price for the product")>
		</cfif>
	</cfif>
</cfoutput>