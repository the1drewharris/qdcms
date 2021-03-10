<cfobject component="designTemplatesCss" name="objdesigncss">
<cfobject component="cfimageeffects" name="objcfimageeffects">
<cfinvoke component="#objdesigncss#" method="getClassicColorSchemes" returnvariable="myColorSchemes">
<cfinvoke component="#objdesigncss#" method="getFontFamily" returnvariable="myFonts">
<cfinvoke component="#objdesigncss#" method="getLayouts" returnvariable="myLayouts">
<cfinvoke component="#Application.objsite#" method="getSites" returnvariable="allsites">
<cfinvoke component="#objcfimageeffects#" method="getalleffects" returnvariable="alleffects">
<cfoutput>
	<cfinclude template="/display/errors.cfm">
	<h1>#action#</h1>
	<form name="frmadd" action="#formaction#" id="form" method="post">
		<input type="hidden" name="siteid" value="#application.objtextconversion.setformValue('siteid')#" />
		<table id="webPageEditorTable"  class="htmform" cellpadding="3">
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">Site Name
						 	<input type="text" name="sitename" value="#application.objtextconversion.setformValue('sitename')#" />
						</label>
						
						<label class="name">Site City
						    <input type="text" name="scity" value="#application.objtextconversion.setformValue('scity')#" />
						</label>
						
						<label class="name">Site State
						    <input type="text" name="sstate" value="#application.objtextconversion.setformValue('sstate')#" />
						</label>
						
						<label class="name">Organization Name
							<input type="text" name="orgname" value="#application.objtextconversion.setformValue('orgname')#" />
						</label>
						
						<label class="name">Site Title
							<input type="text" name="sitetitle" value="#application.objtextconversion.setformValue('sitetitle')#" />
						</label>
						
						<label class="name">Sub Title
							<input type="text" name="subtitle" value="#application.objtextconversion.setformValue('subtitle')#" />
						</label>
							
						<label class="name">Site Keywords
							<textarea name="sitekeywords" cols="30" rows="10" />#application.objtextconversion.setformValue('sitekeywords')#</textarea>
						</label>
							
						<label class="name">Site Description
							<textarea name="sitedescription" cols="30" rows="10" />#application.objtextconversion.setformValue('sitedescription')#</textarea>
						</label>
						
						
						<label class="name">Site Phone Number
						    <input type="text" name="orgphone" value="#application.objtextconversion.setformValue('orgphone')#" />
						</label>
						
						<label class="name">Default Area Code
						    <input type="text" name="DEFAULTAREACODE" value="#application.objtextconversion.setformValue('defaultareacode')#" />
						</label>
						   
						<label class="name">Comments emailed to (Admin)
							<input type="text" name="commentemail" value="#application.objtextconversion.setformValue('commentemail')#" />
						</label>
						
						<label class="name">CC emailed to
							<input type="text" name="cc_commentemail" value="#application.objtextconversion.setformValue('cc_commentemail')#" />
						</label>
						
						<label class="name">Other DB to Synch
							<input type="text" name="altnamedb" value="#application.objtextconversion.setformvalue('altnamedb')#" />
							<div class="clear"></div>
						</label>
								
						<h3>Advanced Options</h3>
						<dl id="advSSpecsDL" class="slider">
							<dt>Advanced Site Specifics</dt>
							<dd class="slideElement">
								<cfset parentsiteid=application.objtextconversion.setFormValue('parentid')>
								<label class="name">Parent Site
							  		<select name="parentid">
										<option selected value="0">No parent</option>
										<cfloop query="allSites"> 
											<cfif siteid eq parentsiteid>
											  	<cfset selValue = "selected">
										  	<cfelse>
										  		<cfset selValue = "">
										  	</cfif>
										  	<option value="#siteid#" #selValue#>#sitename#</option>
									  	</cfloop>  
									</select>
									<div class="clear"> </div>
								</label>
								
								<cfset idoflayout=application.objtextconversion.setformValue('layoutid')>
								<label class="name">Template
									<select name="layoutid">
										<cfloop query="mylayouts">
											<option value="#layoutid#" <cfif idoflayout EQ layoutid>Selected</cfif>>#layoutname#</option>
										</cfloop>
									</select>
								</label>
								
								<cfset idofcolorscheme=application.objtextconversion.setformValue('colorschemeid')>
								<label class="name">Color Scheme
									<select name="colorschemeid">
										<cfloop query="mycolorschemes">
											<option value="#colorschemeid#" <cfif idofcolorscheme EQ colorschemeid >Selected</cfif>>#colorschemename#</option>
										</cfloop>
									</select>
								</label>
								
								<cfset idoffontfamily=application.objtextconversion.setformValue('fontfamily')>
								<label class="name">Fonts
									<select name="fontfamilyid">
										<cfloop query="myfonts">
											<option value="#fontfamilyid#" <cfif idoffontfamily EQ fontfamilyid>Selected</cfif>>#fontfamilyname#</option>
										</cfloop>
									</select>
								</label>
								
								<cfset styleofgallerythumb=application.objtextconversion.setformValue('gallerythumbstyle')>
								<label class="name">Gallery Thumb Style
									<select name="gallerythumbstyle">
										<cfloop list="#alleffects#" index="effectlist" delimiters=",">		
											<cfset effect=Trim(listgetat(effectlist,1,":"))>
											<cfset effectname=Trim(listgetat(effectlist,2,":"))>
											<option value="#effectname#" <cfif styleofgallerythumb EQ effectname>Selected</cfif>>#effectname#</option>
										</cfloop>
									</select>
								</label>
								
								<cfset idofimagethumbstyle=application.objtextconversion.setformValue('idofimagethumbstyle')>
								<label class="name">Images Thumb Style
									<select name="imagesthumbstyle">
										<cfloop list="#alleffects#" index="effectlist" delimiters=",">
											<cfset effectname=Trim(listgetat(effectlist,2,":"))>
											<cfset effect=Trim(listgetat(effectlist,1,":"))>
											<option value="#effectname#" <cfif idofimagethumbstyle EQ effectname>Selected</cfif>>#effectname#</option>
										</cfloop>
									</select>
								</label>
								
								<cfset imgperrow=application.objtextconversion.setformValue('imagesperrow')>
								<label class="name">No of Image Thumbs Per Row
									<select name="imagesperrow">
										<cfloop from="2" to="10" index="i">
											<option value="#i#" <cfif imgperrow EQ i>Selected</cfif>>#i#</option>
										</cfloop>
									</select>
								</label>
								
								<cfset imgperpage=application.objtextconversion.setformValue('imagesperpage')>
								<label class="name">No of Image Thumbs Per Page
									<select name="imagesperpage">
										<cfloop from="2" to="100" index="i">
											<option value="#i#" <cfif imgperpage EQ i>Selected</cfif>>#i#</option>
										</cfloop>
									</select>
								</label>
								
								<cfset addrneeded=application.objtextconversion.setformValue('addressneeded')>
								<label class="name">Do you want address information on Registration Page?
									<select name="addressneeded">
										<option value="0" <cfif addrneeded EQ 0>Selected</cfif>>No</option>
										<option value="1" <cfif addrneeded EQ 1>Selected</cfif>>Yes</option>
									</select>
								</label>
								
								<cfset passneeded=application.objtextconversion.setformValue('passwordneeded')>
								<label class="name">Do you want to set up password on Registration Page?
									<select name="passwordneeded">
										<option value="0" <cfif passneeded EQ 0>Selected</cfif>>No</option>
										<option value="1" <cfif passneeded EQ 1>Selected</cfif>>Yes</option>
									</select>
								</label>
								
								<cfset phneeded=application.objtextconversion.setformValue('phoneneeded')>
								<label class="name">Do you want to have phone number in Registration Page?
									<select name="phoneneeded">
										<option value="0" <cfif phneeded EQ 0>Selected</cfif>>No</option>
										<option value="1" <cfif phneeded EQ 1>Selected</cfif>>Yes</option>
									</select>
								</label>
								
								<cfset themepicker=application.objtextconversion.setformValue('showthemepicker')>
								<label class="name">Do you want to show theme picker on your site?
									<select name="showthemepicker">
									<option value="0" <cfif themepicker EQ 0>Selected</cfif>>No</option>
									<option value="1" <cfif themepicker EQ 1>Selected</cfif>>Yes</option>
									</select>
								</label>
								<div class="clear"></div>
							</dd>
						</dl>
					</fieldset>
				</td>
				
		
		 	</tr>
		 	<tr>
		   		<td align="left">
					<input type="submit" name="Submit" value="Submit">
				</td>
		 	</tr>
		</table>
	</form>
</cfoutput>