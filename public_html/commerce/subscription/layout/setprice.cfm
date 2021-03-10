<cfinvoke component="#application.objproduct#" method="getPricenames" productdsn="#client.siteurl#" returnvariable="pricenames">
<cfinvoke component="#application.objproduct#" method="getItems" neededitems="subscriptionplan" productdsn="#client.siteurl#" returnvariable="subscriableitems">
<cfoutput>
	<h1>#title#</h1>
	<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post">
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">Subscriable Item
							<select name="id" onkeypress="showPrices(this.value)" onclick="showPrices(this.value)">
								<option value="">Select one...</option>
								<cfloop query="subscriableitems">
								<option value="#id#" <cfif url.id EQ id>Selected</cfif>>#itemname#</option>
								</cfloop>
							</select>
						</label>
						
						<label class="name">Price Name
							<cfset thisprice=application.objtextconversion.setformvalue('pricenameid')>
							<select name="pricenameid">
								<option value="">Select one ...</option>
								<cfloop query="pricenames">
									<option value="#pricenameid#"<cfif thisprice EQ pricenameid>Selected</cfif>>#pricename#</option>
								</cfloop>
							</select>
						</label>
						
						<label class="name">Price
							<input type="text" name="price" value="#application.objtextconversion.setformvalue('price')#">
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
</cfoutput>