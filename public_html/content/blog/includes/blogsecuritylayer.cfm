<!--- 
	Logic
	Guest Blogger: Can not publish blog entries. Can add and edit blog entries.
	Blogger: Can publish blog entries. Can add and edit blog entries created by the user.
	Master Blogger: Can add and edit all blog entries.
	CMS User and onwards: Can add and edit all blog entries if blog access is given to him/her 
--->

<cfswitch expression="#client.roleid#">
	<cfcase value="0">
		<cfset myStatusList="Draft,Deactive">
		<cfset entryauthorid=client.masternameid>
	</cfcase>
	<cfcase value="1">
		<cfset myStatusList="Draft,Published,Deactive">
		<cfset entryauthorid=client.masternameid>
	</cfcase>
	<cfdefaultcase>
		<cfset myStatusList="Draft,Published,Deactive">
		<cfset entryauthorid=0>
	</cfdefaultcase>
</cfswitch>