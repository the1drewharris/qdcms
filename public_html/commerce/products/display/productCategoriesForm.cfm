<cfoutput>
	<cfset thiscategory="">
	<cfif isDefined('id')>
		<cfinvoke component="#application.objproduct#" method="getProductCategories" productdsn="#client.siteurl#" id="#id#" returnvariable="mycategories">
	<cfloop query="mycategories">
		<cfset thiscategory="#listappend(thiscategory,'#categoryid#')#">
	</cfloop>
	</cfif>
	<!--- <cfset thiscategory=application.objtextconversion.setformValue('categoryid')> --->
	<dl id="categoriesDL" class="slider">
		<dt id="categoriesDT">Categories</dt>
		<dd class="slideElement">
			<cfloop query="categories">
				<cfloop from="2" to="#NESTLEVEL#" index="i">&mdash;</cfloop>
				<input type="checkbox" name="categoryid" value="#categoryid#" <cfif listfindnocase(thiscategory,categoryid) GT 0>Checked</cfif>>#category#<br />
			</cfloop>
		</dd>
	</dl>
	<!--- categories=#thiscategory# --->
	<div class="clear"></div>
</cfoutput>