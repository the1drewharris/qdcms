<cfset TabChar = Chr(9)>
<cfset NewLine = Chr(13) & Chr(10)>
<cfinvoke component="#application.abCFC#" method="getContactInfo" contactdsn="#client.siteurl#" nameid="#url.id#" returnVariable="contactInfo" />
<cfinvoke component="#application.abCFC#" method="getContactGroups" contactdsn="#client.siteurl#" nameid="#url.id#" returnVariable="contactGroups" />
<cfset cardname="vcard_#url.id#">

<cfset mygroups="">
<cfset mygroupnames="">

<cfoutput query="contactGroups">
<cfset mygroups="#listappend(mygroups, groupid)#">
<cfset mygroupnames="#listappend(mygroupnames, name)#">
</cfoutput>

<cfcontent type="text/x-vCalendar">
<cfheader name="Content-Disposition" value="filename=#cardname#.vcf"> 
<cfoutput query="contactInfo">BEGIN:VCARD
VERSION:3.0
N:<cfif lastname neq "" and firstname neq "">#lastname#;#firstname#<cfelse>#company#</cfif>
FN:<cfif lastname neq "" and firstname neq "">#firstname# #lastname#<cfelse>#company#</cfif>
#NewLine#
<cfif company neq "">ORG:#company#;</cfif>
#NewLine#
<cfif wemail neq "">EMAIL;type=WORK:#wemail#</cfif>
#NewLine#
<cfif hemail neq "">EMAIL;type=HOME:#hemail#</cfif>
#NewLine#
<cfif wphone neq "">TEL;type=WORK;type=pref:#wphone#</cfif>
#NewLine#
<cfif mphone neq "">TEL;type=CELL:#mphone#</cfif>
#NewLine#
<cfif hphone neq "">TEL;type=HOME:#hphone#</cfif>
#NewLine#
ADR;type=WORK;type=pref:;;#address1#;#city#;#state#;#zip#;
#NewLine#
<cfif url neq "">URL;type=WORK:http://#url#</cfif>
#NewLine#
<cfif aol neq "">X-AIM;type=WORK;type=pref:#aol#</cfif>
#NewLine#
<cfif yahoo neq "">X-YAHOO;type=WORK;type=pref:#yahoo#</cfif>
#NewLine#
<cfif icq neq "">X-ICQ;type=WORK;type=pref:#icq#</cfif>
#NewLine#
CATEGORIES:#mygroupnames#
END:VCARD</cfoutput>