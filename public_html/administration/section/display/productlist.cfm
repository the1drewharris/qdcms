<cfoutput>
	<cfinvoke component="#application.objqdsecurity#" method="getQdProducts" returnvariable="allproducts">
	<cfloop query="allproducts">
		<cfif application.objtextconversion.setformValue('product#productid#') NEQ "">
			<cfset sectionIsInProduct=TRUE>
		<cfelse>
			<cfset sectionIsInProduct=FALSE>
		</cfif>
		<input type="checkbox" name="product#productid#" value="#productid#" <cfif sectionIsInProduct>Checked</cfif>>#product_name# <br />
	</cfloop>
</cfoutput>