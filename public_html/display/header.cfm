<cfoutput>
	<div id="header-bg">
		<div id="header">
			<a href="/"><img src="/siteimages/logo.gif" alt="QDcms" id="logo" /></a>
			<div id="help-link">
				Welcome, #client.firstname# #client.lastname# (<a href="/cms/others/user/profile">Profile</a>)<br />
				<cfif client.dashboardallowed>
					<a href="/cms/others/dashboard">Go to dashboard</a>&nbsp;|&nbsp;
				</cfif>
				<a href="/cms/logout">Logout</a> <br />
				<cfif client.siteurl NEQ '' AND client.siteurl NEQ 0>
					Site: <a href="http://#client.siteurl#" target="_blank">#client.siteurl#</a>&nbsp;|&nbsp;<a href="/cms/others/user/editsite/?s=#client.siteid#">Edit</a>&nbsp;|
				</cfif>
				<a href="/cms/pickasite">Pick a Site</a>
			</div>
			<div class="clear"></div>
			<cfif client.siteid AND IsDefined('session.myNav')>			
				<ul id="navigation">
					<cfset activeIndex=0>
					<cfset noofsections=Arraylen(session.myNav.Section)>
					<cfloop from="1" to="#noofsections#" index="i">
						<cfset sectionname=lcase(replace(session.myNav.Section[i].XmlAttributes.name," ","","all"))>
						<cfif sectionname EQ url.section> 
							<cfset activeValue="active">
							<cfset activeIndex=i>
						<cfelse>
							<cfset activeValue="inactive">
						</cfif>
						<li class="#activeValue#">
							<a href="/cms/#sectionname#" class="#sectionname#"></a>
						</li>
					</cfloop>
				</ul>
				<cfif activeIndex NEQ 0>
					<cfset noofmodules=Arraylen(session.myNav.Section[activeIndex].Module)>
					<div class="clear"></div>
					<ul id="secondary-nav">
						<cfif activeIndex NEQ 0>
							<cfloop from="1" to="#noofmodules#" index="j">
								<cfset modulename=lcase(replace(session.myNav.Section[activeIndex].Module[j].Name.XmlText," ","","all"))>
								<cfset modulecaption=session.myNav.Section[activeIndex].Module[j].DisplayName.XmlText>
								<cfif modulename EQ url.module>
									<cfset activeValue="active">
								<cfelse>
									<cfset activeValue="inactive">
								</cfif>
								<li class="#activeValue#">
									<a href="/cms/#url.section#/#modulename#">#modulecaption#</a>
								</li>
							</cfloop> 
						</cfif>
					</ul>
				</cfif>
				<div class="clear"></div>
			</cfif>
		</div>
	</div>
</cfoutput>