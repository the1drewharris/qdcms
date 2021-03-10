<!--- a:advanced, g:general, t: type, g: groupid, d: duplicate value, e: export, c:copy --->
<cfparam name="url.t" default="g"> 
<cfparam name="url.s" default="0">
<cfparam name="url.g" default="0">
<cfparam name="url.d" default="name">
<cfparam name="url.e" default="0">
<cfparam name="url.c" default="0">

<cfset pageHasMapIcons=FALSE>
<cfset recordsperpage=60>
<cfset rowLabel="">
<cfswitch expression="#url.action#">
	<cfcase value="searchcontacts">
		<cfinclude template="../includes/setvariables.cfm">
		<cfif url.t EQ 'a'>
			<cfset client.searchkey=''>
			<cfset nextlink="/cms/crm/addressbook/searchcontacts/?t=a&e=#url.e#&c=#url.c#&s=">
			<cfset exportlink="/cms/crm/addressbook/searchcontacts/?t=a&e=1&s=#url.s#">
			<cfset exportaction="/cms/crm/addressbook/exportcontacts/?t=a">
			<cfset copylink="/cms/crm/addressbook/searchcontacts/?t=a&c=1&s=#url.s#">
			<cfset pn=Int(url.s/recordsperpage) + 1>
			<cfif IsDefined('form.ab')>
				<cfinclude template="../includes/advancedsearcharguments.cfm">
				<cfif listLen(argsToDisplay) GT 0>
					<cfoutput>
						<h3>Advanced Search Criteria</h3>
						<div class="search-argumens">
							<cfloop list="#argsToDisplay#" index="arg">
								#arg# &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</cfloop>
						</div>
						<div class="clear"><br /></div>
					</cfoutput>
				</cfif>
			</cfif>
			<cfinvoke component="#application.abCFC#" method="searchContacts" contactdsn="#client.siteurl#" pageNumber="#pn#" argumentcollection="#Session.searchArguments#" returnvariable="contacts">
			<cfset n=contacts.NUMOFRECORDS>
		<cfelse>
			<cfset structdelete(session,'searchArguments','FALSE')>
			<cfset nextlink="/cms/crm/addressbook/searchcontacts/?g=#url.g#&e=#url.e#&c=#url.c#&s=">
			<cfset exportlink="/cms/crm/addressbook/searchcontacts/?g=#url.g#&e=1&s=#url.s#">
			<cfset copylink="/cms/crm/addressbook/searchcontacts/?g=#url.g#&c=1&s=#url.s#">
			<cfset pn=Int(url.s/recordsperpage) + 1>
			<cfif isDefined('form.s')>
				<cfset client.searchkey=form.s>
				<cfset url.g=form.g>
			</cfif>
			<cfset exportaction="/cms/crm/addressbook/exportcontacts/?g=#url.g#">
			<cfinvoke component="#application.abCFC#" method="quickSearchContacts" contactdsn="#client.siteurl#" pageNumber="#pn#" criteria="#client.searchkey#" groupid="#url.g#" recordsPerPage="#recordsperpage#" returnvariable="contacts">
			<cfset n=contacts.NUMOFRECORDS>
		</cfif>
	</cfcase>
	<cfcase value="finddups">
		<cfset client.searchkey=''>
		<cfset nextlink="/cms/crm/addressbook/finddups/?d=#url.d#&e=#url.e#&c=#url.c#&s=">
		<cfset exportlink="/cms/crm/addressbook/finddups/?d=#url.d#&e=1&s=#url.s#">
		<cfset copylink="/cms/crm/addressbook/finddups/?d=#url.d#&c=1&s=#url.s#">
		<cfif listfindnocase('name,address,username,clientuserid,wemail,hemail',url.d) EQ 0>
			<cfset url.d='name'>
		</cfif>
		<cfset exportaction="/cms/crm/addressbook/exportcontacts/?d=#url.d#">
		<cfset pn=Int(url.s/recordsperpage) + 1>
		<cfinvoke component="#application.abCFC#" method="findDups" findDup="#url.d#" ds="#client.siteurl#" pageNumber="#pn#" recordsPerPage="#recordsperpage#" returnvariable="contacts">
		<cfset n=contacts.NUMOFRECORDS>
	</cfcase>
	<cfdefaultcase>
		<cfset url.action="showcontacts">
		<cfset client.searchkey=''>
		<cfset structdelete(session,'searchArguments','FALSE')>
		<cfset nextlink="/cms/crm/addressbook/showcontacts/?g=#url.g#&e=#url.e#&c=#url.c#&s=">
		<cfset exportlink="/cms/crm/addressbook/showcontacts/?g=#url.g#&e=1&s=#url.s#">
		<cfset exportaction="/cms/crm/addressbook/exportcontacts/?g=#url.g#">
		<cfset copylink="/cms/crm/addressbook/showcontacts/?g=#url.g#&c=1&s=#url.s#">
		<cfset client.searchkey="">
		<cfset pn=Int(url.s/recordsperpage) + 1>
		<cfinvoke component="#application.abCFC#" method="quickSearchContacts" contactdsn="#client.siteurl#" pageNumber="#pn#" recordsPerPage="#recordsperpage#" returnvariable="contacts">
		<cfset n=contacts.NUMOFRECORDS>
	</cfdefaultcase>
</cfswitch>
<cfoutput>
	<cfif url.e EQ 1>
		<cfinclude template="../display/exportoptions.cfm">
	<cfelseif url.c EQ 1>
		<cfinclude template="../display/groupoptions.cfm">
	<cfelse>
		<cfif url.action NEQ 'finddups'>
			<cfinclude template="../display/contactsearchform.cfm">
		<cfelse>
			<cfinclude template="../display/finddupsoptions.cfm">
		</cfif>
	</cfif>
	
	<div class="clear"></div>
	<cfif contacts.recordcount GT 0>
		<cfinvoke component="#application.objpagination#" method="get" prefixURL="#nextlink#"  rowLabel="#rowlabel#" perPage="#recordsperpage#" totalRows="#n#" delimeter="&bull;" currentValue="#url.s#" returnVariable="pagination"> 
		<cfset start=url.s + 1>
		<cfset end=url.s + 60>
		<cfif end GT n>
			<cfset end=n>
		</cfif>
		<cfset pagination="Contacts #start# - #end# of " & pagination>
			<div id="addressBookWrapper"> 
				<div class="titleBar">
					<a href="##" id="checkAll"><img src="/siteimages/icon-select-all-gallery.png" /></a>
					<cfif url.g NEQ -2>
					<a href="##" id="doDelete"><img src="/siteimages/icon-gallery-delete.png" /></a>
					<a href="#copylink#" id="doCopy"><img src="/siteimages/icon-gallery-copy.png" /></a>
					<a href="#exportlink#"><img src="/siteimages/icon_export.png" /></a>
					<cfelse>
					<a href="##" id="restoreContacts">Restore</a>
					</cfif>
					<div id="addressbook-pagination">
						#pagination#
					</div>
				</div>
				
				<ul id="addressBookContainer">
					<cfloop query="contacts">
						<li id="#userid#">
							<div class="contactInfo">
								<div class="basicInfo">
									<span class="name">
										#firstname# #lastname#
									</span>
									<cfif company NEQ ''>
									<span class="title">
										#company#
									</span>
									</cfif>
									<span class="cui">
										<cfif Trim(clientuserid) NEQ ''>
										CUI: #clientuserid#
										</cfif>
									</span>
								</div>			
								<div class="phone">
									<cfif Trim(hphone) NEQ '' AND Trim(hphone) NEQ 'unknown'>
										<span class="hphone">H: #hphone#</span>
									</cfif>
									<cfif Trim(wphone) NEQ '' AND Trim(wphone) NEQ 'unknown'>
										<span class="wphone">W: #wphone#</span>
									</cfif>
									<cfif Trim(mphone) NEQ '' AND Trim(wphone) NEQ 'unknown'>
										<span class="mphone">M: #mphone#</span>
									</cfif>
								</div>
								<div class="address">
									<cfif Trim(wemail) NEQ '' AND Trim(wemail) NEQ 'unknown'>
										<span class="email">W: <a href="mailto:#wemail#">#application.objtextconversion.shortenText(lcase(wemail),26)#</a></span>
									</cfif>
									<cfif Trim(hemail) NEQ '' AND Trim(hemail) NEQ 'unknown'>
										<span class="email">H: <a href="mailto:#hemail#">#application.objtextconversion.shortenText(lcase(hemail),26)#</a></span>
									</cfif>
									<cfset contactHasAddress=FALSE>
									<cfif Trim(address1) NEQ '' AND Trim(address1) NEQ 'unknown'>
										<cfset contactHasAddress=TRUE>
										<cfif pageHasMapIcons EQ FALSE><cfset pageHasMapIcons=TRUE></cfif>
										<span class="addr">
											#address1# #address2# <br />
											#city# #state# #zip#
										</span>
									</cfif>
								</div>
							</div>
							<div class="clear"></div>
							<div class="contactActions">
								<input class="checkBox" type="checkbox" id="user_#userid#">
								<a href="/cms/crm/addressbook/editcontact/?id=#userid#"><img src="/siteimages/icon-edit-gallery.gif" /></a>
								<a href="/cms/crm/addressbook/makevcard/?id=#userid#"><img src="/siteimages/icon-vcard-gallery.gif" /></a>
								<a href="/cms/crm/addressbook/notes/?id=#userid#"><img src="/siteimages/icon-gallery-notes.gif" /></a>
								<a href="/cms/crm/addressbook/eventgroups/?id=#userid#"><img src="/siteimages/icon-calendar.png" /></a>
								<cfif contactHasAddress>
								<a id="viewmapof#userid#" href=""><img src="/siteimages/icon-gallery-map.gif" title="View Map"></a>
								</cfif>
								<cfif hasReviews EQ TRUE>
									<a id="review_#userid#" href="/cms/crm/addressbook/reviews/?id=#userid#"><img src="/siteimages/icon-review.png"></a>
								</cfif>
							</div>
						</li>
					</cfloop>
				</ul>
			</div>
	<cfelse>
		<div class="no-records">
			There are no contacts to display
		</div>
	</cfif>
</cfoutput>