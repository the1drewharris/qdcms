<cfoutput>
	<cfinvoke component="#application.abCFC#" method="getRecentContacts" contactdsn="#client.siteurl#" returnVariable="recentContacts">
	<ul id="recentContacts">
	<cfloop query="recentContacts" startRow="1" endRow="10">
		<li id="c#userid#">
			<div class="contact group">
				<a href="/cms/crm/addressbook/editcontact/?id=#userid#">
					<cfif len(firstname)>
						#firstname#
						<cfif len(lastname)>
							 #lastname#
						</cfif>
					<cfelseif len(company)>
						#company#
					<cfelse>
						<i>No Name</i>
					</cfif>
				</a>
				<span>
					#Application.objtimedateconversion.convertDate(lastupdated, "mmm dd, yyyy")#
					#Application.objtimedateconversion.convertTime(lastupdated, "hh:mmtt")#
				</span>
			</div>
			
			<div class="detail">
				<cfif listfindnocase(client.siteurl,'jbfsale',".") GT 0>
					<cfif Trim(clientuserid) NEQ ''>Consignor Number: #clientuserid#<br /></cfif>
				<cfelse>
					<cfif Trim(username) NEQ ''><strong>Username: </strong> #username#<br /></cfif>
				</cfif>
				
				<cfloop list="WEMAIL,HEMAIL,MEMAIL,OEMAIL" index="email">
					<cfif len(Evaluate(email))>
						<strong>#left(email,1)#:</strong> <a href="mailto:#Evaluate(email)#">#Evaluate(email)#</a><br />
					</cfif>
				</cfloop>
				
				<cfloop list="WPHONE,HPHONE,MPHONE,OPHONE,FPHONE" index="phone">
					<cfif len(Evaluate(phone))>
						<strong>#left(phone,1)#:</strong> #Application.objtextconversion.phoneFormat(Evaluate(phone),"(xxx) xxx-xxxx")#<br />
					</cfif>
				</cfloop>
				
				<cfif len(url)>
					<strong>URL: </strong>
					<cfif findNoCase('http://',url) GT 0>
						<a target="_blank" href="#url#">#url#</a>
					<cfelse>
						<a target="_blank" href="http://#url#">#url#</a>
					</cfif><br />
				</cfif>
				
				<cfinvoke component="#application.abCFC#" method="getContactGroups" contactdsn="#client.siteurl#" nameid="#userid#" returnVariable="getGroups">
				<cfif getGroups.recordCount GT 0>
					<strong>Groups: </strong>
					<cfloop query="getGroups">
						#name#<cfif currentRow NEQ recordCount>, </cfif>
					</cfloop>
				</cfif>
			</div>
		</li>
	</cfloop>
	</ul>
</cfoutput>