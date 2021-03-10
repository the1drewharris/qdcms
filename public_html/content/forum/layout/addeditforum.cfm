<!--- Logic
	If form.submit is defined, form should be displayed only when there are errors.
		Defined-check for errors.
			No errors: Add or update the forum. Display forum page.
			Erros: display errors
				form.forumid EQ 0, set to add mode, display forum
				form.forumid NEQ 0, set to edit mode, display forum
				
	Else if form.submit not defind
		url.forumid EQ 0, set to add mode, display forum
		url.forumid NEQ 0, set to edit mode, display forum --->
	
<cfoutput>
	<cfparam  name="url.forumid" default="0">
	<cfobject component="formvalidation" name="objformvalidation">
	<cfif isDefined('form.submit')>
		<cfset objformvalidation.set_rules('name','Forum Name','required')>
		<cfset objformvalidation.set_rules('description','Description of the forum','required')>
		<cfif objformvalidation.isvalidform()>
			<cfif form.forumid EQ "0">
				<cfinclude template="/content/forum/actions/addforum.cfm">
			<cfelse>
				<cfinclude template="/content/forum/actions/editforum.cfm">
			</cfif>
			<cflocation url="/cms/content/forum/showforums/" addtoken="false">
		<cfelse>
			<cfset objformvalidation.validation_errors()>
			<cfif form.forumid EQ "0">
				<cfset formaction="addforum">
				<cfset myaction="Add Forum">
			<cfelse>
				<cfset formaction="editforum">
				<cfset myaction="Update Forum">
			</cfif>
		</cfif>
	<cfelse>
		<cfif url.forumid NEQ "0">
			<cfinvoke component="#application.objforum#" method="getforums" forumid="#url.forumid#" deleted="-1" ds="#client.siteurl#" returnvariable="myforum">
			<cfinvoke component="#application.objforum#" method="getparent" forumid="#url.forumid#" ds="#client.siteurl#" returnvariable="getParent">
			<cfinvoke component="#application.objforum#" method="getchildren" forumid="#url.forumid#" ds="#client.siteurl#" returnvariable="children">
			<cfset form.parentid = getParent>
			<cfset form.name=myforum.name>
			<cfset form.description=myforum.description>
			<cfset form.forumid=url.forumid>
			<cfset formaction="editforum">
			<cfset myaction="Update Forum">
		<cfelse>
			<cfset formaction="addforum">
			<cfset myaction="Add Forum">
			<cfset form.forumid="0">	
		</cfif>
	</cfif>
	
	<cfinvoke component="#application.objforum#" method="getEligibleParents" ds="#client.siteurl#" excludeList="#url.forumid#" returnVariable="getForums">
		
	<h1>#myaction#</h1>
	<form name="frmforum" action="/cms/content/forum/#formaction#/" id="form" method="post">
		<input type="hidden" name="forumid" value="#objformvalidation.set_value('forumid')#">
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
				<fieldset>
					<label class="name">
						Name of the Forum
			    		<input type="text" name="name" value="#objformvalidation.set_value('name')#" />
					</label>
					<div class="clear"></div>
					<label class="name">
						Parent Forum
			    		<select name="parentid">
			    			<option value="0" <cfif objformvalidation.set_value('parentid') EQ 0>selected</cfif>>None</option>
			    		<cfif not isDefined('children') OR children.recordcount EQ 0>
				    		<cfloop query="getForums">
				    			<cfif forumid NEQ url.forumid><option value="#forumid#" <cfif objformvalidation.set_value('parentid') EQ forumid>selected</cfif>>#name#</option></cfif>
				    		</cfloop>
			    		</cfif>
			    		</select>
					</label>
					<div class="clear"></div>
					<label class="name">
						Description<em></em><span class="note"> A few sentences about this forum.</span>
						<textarea name="description" cols="30" rows="10" >#objformvalidation.set_value('description')#</textarea>
					</label>
					<div class="clear"></div>
				</fieldset>
				</td>
				<cfif formaction EQ "editforum">
				<td class="quickWebPageInfo">
					<div class="container">
						<div class="clear"></div>
						<strong>Created on</strong>: #application.objtimedateconversion.convertDate(myforum.createdon,"mmmm dd, yyyy")# #application.objtimedateconversion.converttime(myforum.createdon,"hh:mmtt")#<br />
						<strong>Status</strong>: <cfif myforum.status EQ 1>Active<cfelse>Inactive</cfif><br />
						<strong>Last Updated</strong>: #application.objtimedateconversion.convertDate(myforum.lastupdated,"mmmm dd, yyyy")# #application.objtimedateconversion.converttime(myforum.lastupdated,"hh:mmtt")#<br />
						<cfif myforum.nooftopics GT 0>
							<strong>No of Topics</strong>: #myforum.nooftopics#<br />
							<cfif myforum.noofposts GT 0>
								<strong>No of Posts</strong>: #myforum.noofposts#<br />
								<strong>Last Post Date</strong>: #application.objtimedateconversion.convertDate(myforum.lastpostdate,"mmmm dd, yyyy")# #application.objtimedateconversion.converttime(myforum.lastpostdate,"hh:mmtt")#<br />
								<strong>Last Posted By</strong>: #myforum.lastpostername# <br />
								<a href="http://#client.siteurl#/forum/post/#myforum.lastpostid#" target="_blank">View Post</a>
							</cfif>
						</cfif>
						<div class="clear"></div>
					</div>
				</td>
				</cfif>
		 	</tr>
		 	<tr>
		   		<td colspan="2" align="left">
					<input type="submit" name="Submit" value="#myaction#" >
				</td>
		 	</tr>
		</table>
	</form>
</cfoutput>