<cfinvoke component="#application.objhau#" method="gethauonevent" haudsn="#client.siteurl#" regeventid="#url.e#" returnvariable="hauoptions">
<cfoutput>
	<form id="form" method="post" action="/cms/marketing/heardaboutus/actionaddhautoevent/?e=#url.e#">
		<table class="datagrid" id="managePagesTable">
			<tr class="titlebar">
				<th width="450">HAU Options</th>
				<th>What People See</th>
			</tr>
			<tr>
				<td>
					<cfloop query="hauoptions">
						<cfloop from="1" to="#nestLevel#" index="i">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</cfloop>
						<!--- <cfif nestlevel GT 0> --->
							<input type="checkbox" name="hauoptions_#aboutusid#" value="#aboutusid#" <cfif intheevent EQ 1>Checked</cfif>>
						<!--- </cfif>  --->
						#aboutus# <br />
					</cfloop>
				</td>	
				<td valign="top">
					<cfif hauoptions.recordcount GT 0>
						<cfinclude template="/marketing/heardaboutus/display/whatpplsee.cfm">
					</cfif>
				</td>	
			</tr>
		</table>
		<br />
		<input type="submit" value="Submit">
	</form>
</cfoutput>