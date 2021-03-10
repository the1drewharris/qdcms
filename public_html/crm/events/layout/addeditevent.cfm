<cfoutput>
	<!--- Start: Get/Set Data --->
	<cfparam name="url.eventid" default="0">
	<cfset excludelist="2007020510131656">
	<cfinvoke component="#Application.objevent#" eventdsn="#client.siteurl#" method="getCategories" excludelist="#excludelist#" returnvariable="categories">
	<cfset statusList = "Public,Non-Active,Private,Pending">
	<cfset hourList = "01,02,03,04,05,06,07,08,09,10,11,12">
	<cfset ttList ="AM,PM">
	<cfset repeatList = "None,Every day,Every week,Every month, Every year">
	<cfset repeatEndList = "Never,After,on Date">
	<cfset repeatEndValueList = "Never,repeat-after,repeat-date">
	<!--- End: Get/Set Data --->
	
	<h1>#title#</h1>
	<form id="form" action="#formaction#" method="post">
		<input type="hidden" value="#url.eventid#" name="instanceid" />
		
		<table id="webPageEditorTable">
			<tr>
				<td class="mainWebPageInfo">
					<cfinclude template="../display/eventFormPart1.cfm"> <!--- General Part --->
					<cfinclude template="../display/eventFormPart2.cfm"> <!--- Email Part --->
					<cfinclude template="../display/eventFormPart3.cfm"> <!--- Pricing and registration --->
					<cfinclude template="../display/eventFormPart4.cfm"> <!--- Location --->
					<cfinclude template="../display/eventFormPart5.cfm"> <!--- Contact --->
				</td>
				<td class="quickWebPageInfo"> <!--- Part 6: Groups --->
					<div class="container">
						<h1>Select Groups</h1>
						<cfparam name="eventgroupsli" default="#application.objtextconversion.setFormValue('groupid')#">
						<cfinvoke component="#application.abCFC#" method="getGroupInfo" contactdsn="#client.siteurl#" returnvariable="allgroups">								
						<cfloop query="allgroups">
							<input type="checkbox" name="groupid" value="#groupid#" <cfif listfindnocase(eventgroupsli,groupid) GT 0>Checked</cfif>>#name# <br />
						</cfloop>
					</div>
				</td>
			</tr>
			<tr>
		   		<td colspan="2" align="left">
					<input type="submit" name="Submit" value="Submit">
				</td>
		 	</tr>
		</table>
	</form>
</cfoutput>