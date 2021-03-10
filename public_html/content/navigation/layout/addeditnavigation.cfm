<cfoutput>
	<cfinvoke component="#application.objwebpage#" method="getWebPageHeaders" webdsn="#client.siteurl#" returnVariable="webpages">
	<cfinvoke component="#application.objlinks#" method="getLinks" ds="#client.siteurl#" returnVariable="links">

	<cfif url.action EQ 'editnavigation'>
		<cfinvoke component="#application.objnavigation#" method="getNavigationWithNesting" siteid="#client.siteid#" navid="#url.navid#" returnVariable="navigationItems" ds="#client.siteurl#">
		<cfset thereAreNavigationItems=TRUE>
	<cfelse>
		<cfset thereAreNavigationItems=FALSE>
	</cfif>

	<cfset statuslist="Draft,Published,Private">
	<h1>#title#</h1>
	<form id="form">
		<input type="hidden" id="authorid" name="authorid" value="#client.masternameid#">
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">Navigation Name
				    		<input type="text" id="name" name="name" value="#application.objtextconversion.setformValue('name')#" />
						</label>

						<cfset thisstatus=application.objtextconversion.setformvalue('status')>
						<label class="name">Status
							<select name="status" id="status">
								<cfloop list="#statuslist#" index="status">
									<option value="#status#" <cfif thisstatus EQ status>SELECTED</cfif>>#status#</option>
								</cfloop>
							</select>
						</label>

						<label class="name">
							<table id="navigation-table">
								<tr class="titlebar">
									<th>Content Available</th>
									<th>Navigation</th>
								</tr>
								<tr>
									<td valign="top">
										<cfset prevNest=0>
										<cfparam name="newNestLevel" default = 0>
										<ul id="itemsToAdd" class="navigation-list">
										<cfloop query="webpages">
											<cfparam name="newNestLevel" default = 0>
											<cfif nestLevel EQ prevNest AND currentRow NEQ 1></li></cfif>
											<cfif nestLevel GT prevNest>
												<!--- <a href="##" title="#prevName#" class="addMeAndChildren" id="#wpid#" rel="#prevID#">Add Me + Children</a> ---><ul>
											</cfif>
											<cfif prevNest GT nestLevel>
												<!-- prevNest: #prevNest#, newNestlevel: #newNestLevel#<br/> -->
												<!--- <cfif not IsNumeric(newNestLevel)><cfset nestLevel=0></cfif> --->
												 <cfset nestDifference = prevNest - newNestLevel>
												<cfloop from="1" to="#nestDifference#" index="i">
													</li></ul></li>
												</cfloop>
											</cfif>

											<li id="#wpid#"><a href="##" title="#name#" class="addMe" alt="wp" rel="#wpid#" id="#wpid#" parentid="#parent#">#name#</a>
											<cfset prevID = wpid>
											<cfset prevName = name>
											<cfset prevNest = newNestLevel>
										</cfloop>
										<!--- prevNest: #prevNest#<br/> --->
										<cfloop from="1" to="#prevNest#" index="i">	</li></ul></cfloop>
										</li>
										<cfloop query="links">
											<li id="#linkid#"><a href="##" title="#name#" class="addMe" alt="link" rel="#linkid#" id="#linkid#" style="color:RED;">#name#</a></li>
										</cfloop>
										</ul>
									</td>
									<td valign="top">
										<ul id="new-nav" class="navigation-list">
										<cfif thereAreNavigationItems>
											<cfif navigationItems.recordCount GT 0>
												<cfset prevNest = 1>
												<cfloop query="navigationItems">
													<cfif newNestLevel EQ prevNest AND currentRow NEQ 1></li></cfif>
													<cfif newNestLevel GT prevNest>
														<ul>
													</cfif>
													<cfif prevNest GT nestLevel>
														<cfset newNestLevel = prevNest - nestLevel>
														<cfloop from="1" to="#nestDifference#" index="i">
															</li></ul></li>
														</cfloop>
													</cfif>

													<cfif wpid NEQ 0><cfset itemID = 'item#wpid#'></cfif>
													<cfif linkid NEQ 0><cfset itemID = 'link#linkid#'></cfif>

													<li id="#itemID#" title="#name#" class="new" <cfif linkid NEQ 0>style="color:RED;"<cfelse>style="color:BLACK;"</cfif>>#name#
													<cfset prevID = id>
													<cfset prevName = name>
													<cfset prevNest = newNestLevel>
												</cfloop>
												<cfloop from="0" to="#prevNest#" index="i">	</li></ul></cfloop>
											</cfif>
										</cfif>
									</td>
								</tr>
							</table>
						</label>
					</fieldset>
				</td>
				<td class="quickWebPageInfo">
					<div class="container">
						<cfinclude template="../display/rightcolumn.cfm">
					</div>
				</td>
		 	</tr>
		 	<tr>
		   		<td colspan="2">
					<input type="button" name="Save" id="save" value="Save" />
				</td>
		 	</tr>
		</table>
	</form>
</cfoutput>