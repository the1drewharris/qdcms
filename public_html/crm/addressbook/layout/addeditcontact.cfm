<cfoutput>
	<h1>#title#</h1>
	<cfinvoke component="addressbook" method="getStates" returnVariable="allStates" country="0">
	<form id="form" action="/cms/crm/addressbook/#formaction#" method="post" enctype="multipart/form-data">
		<input name="mynameid" type="hidden" value="#application.objtextconversion.setformvalue('mynameid')#">
		<table id="webPageEditorTable">
			<tr>
				<td class="mainWebPageInfo">
					<cfif isDefined('thisContact')>
						<cfif thisContact.recordcount eq 1>
							<p>Contact Created (date time): <cfif thisContact.timecreated eq "">not recorded<cfelse>#application.objtimedateconversion.convertdate(thisContact.timecreated,"mmm dd, yyyy")# - #application.objtimedateconversion.converttime(thisContact.timecreated)#</cfif></p>
							<p>Last Updated (date time): #application.objtimedateconversion.convertdate(thisContact.lastupdated,"mmm dd, yyyy")# - #application.objtimedateconversion.converttime(thisContact.lastupdated)# </p>
						</cfif>
					</cfif>
					<fieldset>
						<div class="single-line">
							<div class="multi-column1">
								<div class="justLabel">First Name<em>*</em></div>
								<input name="firstname" value="#application.objtextconversion.setformvalue('firstname')#" />
							</div>
							<div class="multi-column1">
								<div class="justLabel">Last Name<em>*</em></div>
								<input name="lastname" value="#application.objtextconversion.setformvalue('lastname')#" />
							</div>
							<div class="multi-column1">
								<div class="justLabel">Middle Name</div>
								<input name="middlename" value="#application.objtextconversion.setformvalue('middlename')#" />
							</div>
						</div>
						
						<label class="name">Company
							<input name="company" value="#application.objtextconversion.setformvalue('company')#">
						</label>
						<div class="clear"></div>
						
						<label class="name">Title
							<input name="title" value="#application.objtextconversion.setformvalue('title')#">
						</label>
						<div class="clear"></div>
						
						<div class="single-line">
							<div class="multi-column1">
								<div class="justLabel">Cell Phone</div>
								<input name="mphone" value="#application.objtextconversion.setformvalue('mphone')#" />
							</div>
							<div class="multi-column1">
								<div class="justLabel">Home Phone</div>
								<input name="hphone" value="#application.objtextconversion.setformvalue('hphone')#" />
							</div>
							<div class="multi-column1">
								<div class="justLabel">Work Phone</div>
								<input name="wphone" value="#application.objtextconversion.setformvalue('wphone')#" />
							</div>
						</div>
						
						<div class="single-line">
							<div class="multi-column1">
								<div class="justLabel">Other Phone</div>
								<input name="ophone" value="#application.objtextconversion.setformvalue('ophone')#" />
							</div>
							<div class="multi-column1">
								<div class="justLabel">Fax</div>
								<input name="fphone" value="#application.objtextconversion.setformvalue('fphone')#" />
							</div>
							<div class="multi-column1">
								<div class="justLabel">Website</div>
								<input name="myurl" value="#application.objtextconversion.setformvalue('myurl')#" />
							</div>
						</div>
						
						<label class="name">Address Line 1
							<input name="address1" value="#application.objtextconversion.setformvalue('address1')#">
						</label>
						<div class="clear"></div>
						
						<label class="name">Address Line 2
							<input name="address2" value="#application.objtextconversion.setformvalue('address2')#">
						</label>
						<div class="clear"></div>
						
						<div class="single-line">
						    <div class="multi-column1">
								<div class="justLabel">Country</div>
								<cfset thisCountry=application.objtextconversion.setformvalue('country')>
								<cfif thisCountry eq "">
									<cfset thisCountry = "US">
								</cfif>
								<select name="country" id="country-select">
									<cfloop query="application.countries">
										<option value="#countryid#" <cfif thisCountry EQ countryid>SELECTED</cfif>>#countryname#</option>
									</cfloop>
								</select>
							</div>
							<div class="clear"></div>
							<div class="multi-column1">
								<div class="justLabel">City</div>
								<input name="city" value="#application.objtextconversion.setformvalue('city')#" />
							</div>
							<div class="multi-column1">
								<div class="justLabel">State</div>
								<cfset thisState=application.objtextconversion.setformvalue('state')>
								<cfset otherState=thisState>
								<span id="state">
								<select name="state" id="state-select">
									<cfloop query="allStates">
										<cfif thisState EQ stateid><cfset otherState=""></cfif>
										<option value="#stateid#" <cfif thisState EQ stateid>SELECTED</cfif>>#stateid# - #statename#</option>
									</cfloop>
								</select>
								</span>
							</div>
							<div class="multi-column1">
								<div class="justLabel">Zip</div>
								<input name="zip" value="#application.objtextconversion.setformvalue('zip')#" />
							</div>
						</div>
						<div class="clear"></div>
						
						<label class="name">Other State/Province
							<input name="otherState" value="#otherState#">
						</label>
						<div class="clear"></div>
						
						<label class="name">Description
							<textarea name="description">#application.objtextconversion.setformvalue('description')#</textarea>
						</label>
						<div class="clear"></div>
						
						<div class="single-line">
							<div class="multi-column5">
								<div class="justLabel">Image</div>
								<input type="file" name="filedata" size="50"/>
							</div> 
							<cfif url.action EQ 'editcontact'>
								<cfset imgpath=application.objtextconversion.setformvalue('imgpath')>
								<cfif imgpath NEQ ''>
									<input type="hidden" name="imgpath" value="#imgpath#">
									<cfif fileexists('#client.sitepath#/images/tiny/#imgpath#')>
										<div class="multi-column0">
											<img src="http://#client.siteurl#/images/tiny/#imgpath#">
										</div>
									</cfif>
								</cfif>
							</cfif>
				 		</div>
					</fieldset>
						<div class="clear"></div>
						<dl id="emailInfoDL" class="slider">
							<dt id="emailInfoDT">Email</dt>
							<dd class="slideElement">
								<fieldset>
									<div class="single-line">
										<div class="multi-column1">
											<div class="justLabel">Home Email</div>
											<input name="hemail" value="#application.objtextconversion.setformvalue('hemail')#" />
										</div>
										<div class="multi-column1">
											<div class="justLabel">Work Email</div>
											<input name="wemail" value="#application.objtextconversion.setformvalue('wemail')#" />
										</div>
										<div class="multi-column1">
											<div class="justLabel">Mobile Email</div>
											<input name="memail" value="#application.objtextconversion.setformvalue('memail')#" />
										</div>
									</div>
									<div class="single-line">
										<div class="multi-column1">
											<div class="justLabel">Other Email</div>
											<input name="oemail" value="#application.objtextconversion.setformvalue('oemail')#" />
										</div>
									</div>
								</fieldset>
							</dd>
						</dl>
						<br /><div class="clear"></div>
						
						<dl id="personalInfoDL" class="slider">
							<dt id="personalInfoDT">Personal Information</dt>
							<dd class="slideElement">
								<fieldset>
									<div class="single-line">
										<div class="multi-column1">
											<div class="justLabel">Username</div>
											<input name="myusername" value="#application.objtextconversion.setformvalue('myusername')#" />
										</div>
										<div class="multi-column1">
											<div class="justLabel">Password</div>
											<input name="mypassword" <!--- <cfif NOT listContainsNoCase('#client.siteurl#',"jbfsale",".")>type="password"</cfif>  --->value="#application.objtextconversion.setformvalue('mypassword')#" />
										</div>
										<div class="multi-column1">
											<div class="justLabel">Clientuserid</div>
											<input name="clientuserid" value="#application.objtextconversion.setformvalue('clientuserid')#" />
										</div>
									</div>
									<div class="single-line">
										<div class="multi-column1">
											<div class="justLabel">Referred By</div>
											<input name="referredby" value="#application.objtextconversion.setformvalue('referredby')#" />
										</div>
										<div class="multi-column1">
											<cfset thisStatus=application.objtextconversion.setformvalue('maritalstatus')>
											<div class="justLabel">Marital Status</div>
											<select name="maritalstatus">
												<option value="0"<cfif thisStatus EQ 0>SELECTED</cfif>>Single</option>
												<option value="1"<cfif thisStatus EQ 1>SELECTED</cfif>>Married</option>
											</select>
										</div>
										<div class="multi-column1">
											<div class="justLabel">Spouse Name</div>
											<input name="spousename" value="#application.objtextconversion.setformvalue('spousename')#" />
										</div>
									</div>
									<div class="single-line">
										<div class="multi-column1">
											<div class="justLabel">Gender</div>
											<cfset thisGender=application.objtextconversion.setformvalue('gender')>
											<select name="gender">
												<option value="3">N/A</option>
												<option value="0"<cfif thisGender EQ 0>SELECTED</cfif>>Female</option>
												<option value="1"<cfif thisGender EQ 1>SELECTED</cfif>>Male</option>
											</select>
										</div>
										<div class="multi-column1">
											<div class="justLabel">Date Of Birth</div>
											<input name="dob" value="#application.objtextconversion.setformvalue('dob')#" />
										</div>
									</div>
								</fieldset>
							</dd>
						</dl>					
						<br /><div class="clear"></div>
						
						<dl id="IMinfoDL" class="slider">
							<dt id="IMinfoDT">Instant Messenger</dt>
							<dd class="slideElement">
								<fieldset>
									<div class="single-line">
										<div class="multi-column1">
											<div class="justLabel">AOL</div>
											<input name="aol" value="#application.objtextconversion.setformvalue('aol')#" />
										</div>
										<div class="multi-column1">
											<div class="justLabel">YAHOO</div>
											<input name="yahoo" value="#application.objtextconversion.setformvalue('yahoo')#" />
										</div>
										<div class="multi-column1">
											<div class="justLabel">MSN</div>
											<input name="msn" value="#application.objtextconversion.setformvalue('msn')#" />
										</div>
									</div>
									<div class="single-line">
										<div class="multi-column1">
											<div class="justLabel">MAC</div>
											<input name="mac" value="#application.objtextconversion.setformvalue('mac')#" />
										</div>
										<div class="multi-column1">
											<div class="justLabel">JABBER</div>
											<input name="jabber" value="#application.objtextconversion.setformvalue('jabber')#" />
										</div>
										<div class="multi-column1">
											<div class="justLabel">ICQ</div>
											<input name="icq" value="#application.objtextconversion.setformvalue('icq')#" />
										</div>
									</div>
								</fieldset>
							</dd>
						</dl>
						<br /><div class="clear"></div>
						
						<dl id="SocialInfoDL" class="slider">
							<dt id="SocialInfoDT">Social Media</dt>
							<dd class="slideElement">
								<fieldset>
									<div class="single-line">
										<div class="multi-column1">
											<div class="justLabel">Twitter</div>
											<input name="twitter" value="#application.objtextconversion.setformvalue('twitter')#" />
										</div>
										<div class="multi-column1">
											<div class="justLabel">Linkedin</div>
											<input name="linkedin" value="#application.objtextconversion.setformvalue('linkedin')#" />
										</div>
										<div class="multi-column1">
											<div class="justLabel">Youtube</div>
											<input name="youtube" value="#application.objtextconversion.setformvalue('youtube')#" />
										</div>
									</div>
									<div class="single-line">
										<div class="multi-column1">
											<div class="justLabel">Facebook</div>
											<input name="facebook" value="#application.objtextconversion.setformvalue('facebook')#" />
										</div>
										<div class="multi-column1">
											<div class="justLabel">MySpace</div>
											<input name="myspace" value="#application.objtextconversion.setformvalue('myspace')#" />
										</div>
										<div class="multi-column1">
											<div class="justLabel">FriendFeed</div>
											<input name="friendfeed" value="#application.objtextconversion.setformvalue('friendfeed')#" />
										</div>
									</div>
									<div class="single-line">
										<div class="multi-column1">
											<div class="justLabel">Plaxo</div>
											<input name="plaxo" value="#application.objtextconversion.setformvalue('plaxo')#" />
										</div>
									</div>
								</fieldset>
							</dd>
						</dl>
						<div class="clear"></div>
				</td>
				<td class="quickWebPageInfo">
					<cfinclude template="../display/groups.cfm">
					<input type="submit" id="submit" name="submit" value="Submit">
				</td>
			</tr>
		</table>
	</form>
</cfoutput>