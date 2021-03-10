<cfexecute name="/usr/bin/rsync" arguments= "-a /home/drew/domains/vcientertainment.com/public.html/files store.vcientertainment.com:/var/www/html/sandbox/files" timeout="600" />


<!---
<cfquery name="getSites" datasource="deltasystem">
SELECT
	SITEURL
FROM SITE
WHERE STATUS = 'DEV'
AND SITEURL LIKE '%.COM'
</cfquery>
<cfflush interval="10">
<ol>
	<cfoutput query="getSites">
	<li>
	#siteurl# - #getSites.currentRow#
	<cfinvoke component="#application.objsite#" method="addDsn" sitedsn="#siteurl#">
	</li>
	</cfoutput>
</ol>
--->
