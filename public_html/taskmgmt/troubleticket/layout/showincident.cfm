<cfparam name="url.incidentid" default="0">
<cfset iHavePermission=FALSE>
<cfif url.incidentid EQ "0">
	<cflocation url="/cms/taskmgmt/troubleticket/reportedincidents" addtoken="false">
</cfif>

<cfinvoke component="#application.objincident#" method="getincidents" incidentdsn="#thissite#" incidentid="#url.incidentid#" returnvariable="incident">
<cfif client.roleid EQ 7>
	<cfset iHavePermission=TRUE>
<cfelse>
	<cfif listfindnocase(client.allowedsites,incident.siteid) GT 0>
		<cfset iHavePermission=TRUE>
	</cfif>
</cfif>
<!--- <cfoutput >#iHavePermission#</cfoutput>
<cfabort > --->
<cfif iHavePermission>
	<cfinvoke component="#application.objtaskmanagement#" method="getAllCommentsOnIncident" taskdsn="#thissite#" incidentid="#url.incidentid#" returnvariable="comments">
	<cfinvoke component="#application.objtaskmanagement#" method="getsolutions" taskdsn="#thissite#" incidentid="#url.incidentid#" returnvariable="solutions">
	<cfset solutionids=valuelist(solutions.cid)>
	<cfoutput>
		<h3>#incident.incidentname#</h3><br />
		<div id="form">
			<table id="webPageEditorTable">
				<tr>
					<td class="mainWebPageInfo" style="padding:10px;width:565px">
						<cfinvoke component="#application.abCFC#" method="getContactviaNameid" contactdsn="#APPLICATION.masterdsn#" NAMEID="#incident.nameid#" returnvariable="myUser">	
						
						<b>Reported by</b>: <a href="mailto:#myUser.wemail#">#myUser.firstName# #myUser.lastname#</a> <br /><br />
						<cfif incident.incidentdescription NEQ "">
							<b>Incident Description</b><br /> 
							#REReplace(Application.objtextconversion.stripHTML(incident.incidentdescription),"#chr(10)#","<br />","All")#<br /><br />
						</cfif>
						<cfif incident.incidenturl NEQ ''>
							<b>URL</b>: <a href="#incident.incidenturl#" target="_blank">#incident.incidenturl#</a> <br /><br />
						</cfif>
						<cfif incident.errordescription NEQ ''>
							<b>Error Description</b>: <br />#incident.errordescription# <br /><br />
						</cfif>
						<cfset timereported=incident.timereported>
						<cfset reporteddate=Application.objtimedateconversion.convertDate(timereported,"dddd, mmm dth, yyyy")>
						<cfset reportedtime=Application.objtimedateconversion.convertTime(timereported,"h:mmtt")>
						<b>Time Reported</b>: #reporteddate# #reportedtime#<br /><br />
						
						
						<cfif incident.incidentdoing NEQ "">
							<b>What were you doing when you experienced this problem?</b>: <br />#incident.incidentdoing# <br /><br />
						</cfif>
						
						<cfif incident.screenshotid NEQ "">
							<b>Screenshot</b>: <a href="http://#thissite#/troubleticket_screenshots/#incident.screenshotname#" target="_blank">View</a><br /><br />
						</cfif>
						
						<cfif incident.siteid NEQ "">
							<b>Site</b>: #application.objsite.getSiteURL(incident.siteid)#<br /><br />
						</cfif>
						
						<cfif incident.browserid NEQ "">
							<b>Browser</b>: #incident.browsername#<br /><br />
						</cfif>
						
						<cfif incident.osid NEQ "">
							<b>Operating System</b>: #incident.osname#<br /><br />
						</cfif>
						
						<cfif incident.screenres NEQ "">
							<b>Screen Resolution</b>: #incident.screenres#<br /><br />
						</cfif>
						
						<cfif incident.statusid EQ 0 AND client.roleid GTE 6>
							<cfinclude template="/taskmgmt/troubleticket/display/addtask.cfm">
						</cfif>
					</td>
				
					<td class="quickWebPageInfo">
						<div class="container">
							<cfinclude template="/taskmgmt/troubleticket/display/commentform.cfm">
							<br /><br />
							<cfif comments.recordcount GT 0>
								<cfinvoke component="#application.abCFC#" method="getcontactinfo" contactdsn="#APPLICATION.masterdsn#" nameid="#comments.createdby#" returnvariable="myUser">
								<div class="clear"></div>
								<div class="includeGroups">
									<dl id="includeGroups" class="slider">
										<dt>Comment by: #myuser.firstname# #myuser.lastname#</dt>
										<dd class="slideElement">
											<cfset commentdate=application.objtimedateconversion.convertDate(comments.recordedon,'mmm dd, yyyy')>
											<cfset commenttime=application.objtimedateconversion.convertTime(comments.recordedon,'hh:mmtt')>
											#REReplace(Application.objtextconversion.stripHTML(comments.comment),"#chr(10)#","<br />","All")# <br /><br />
											#commentdate# #commenttime#
											<cfif listfindnocase(solutionids,comments.cid) GT 0>
												<br /><br /><b>*This comment is a solution to this incident.</b>
											</cfif>
										</dd>
									</dl>
								</div><br />
								<div style="clear:both;"></div>
								<cfset count=1>
								<cfloop query="comments">
									<cfset commentdate=application.objtimedateconversion.convertDate(recordedon,'mmm dd, yyyy')>
									<cfset commenttime=application.objtimedateconversion.convertTime(recordedon,'hh:mmtt')>
									<cfif count GTE 2>
										<cfinvoke component="#application.abCFC#" method="getcontactinfo" contactdsn="#APPLICATION.masterdsn#" nameid="#comments.createdby#" returnvariable="myUser">
										<div class="hiddencomments#count#">
											<dl id="hiddencommentsDL#count#" class="slider">
												<dt id="hiddencommentsDT#count#">Comment By: #myuser.firstname# #myuser.lastname#</dt>
												<dd class="slideElement">
													#REReplace(Application.objtextconversion.stripHTML(comment),"#chr(10)#","<br />","All")#<br /><br />
													#commentdate# #commenttime#
													<cfif listfindnocase(solutionids,comments.cid) GT 0>
														<br /><br /><b>*This comment is a solution to this incident.</b>
													</cfif>
												</dd>
											</dl>
										</div>
										<br />
									</cfif>
									<cfset count=count + 1>
								</cfloop>
							</cfif>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</cfoutput>
<cfelse>
	<cflocation url="/cms/#url.section#/#url.module#/showincidents" addtoken="false">
</cfif>
