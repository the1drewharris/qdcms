<cfparam name="migrateDate" default="2010112901000000">
<cfparam name="thisSiteURL" default="swfortworth.jbfsale.com">
<cfquery name="restoreDeleted" datasource="#thisSiteURL#">
UPDATE NAME
SET STATUS = '1'
WHERE STATUS = '0'
AND LASTUPDATED < '#migrateDate#'
</cfquery>