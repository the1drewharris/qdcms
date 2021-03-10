<cfparam name="url.ids" default="">
<cfset client.savedids=url.ids>
<cflocation url="#client.copylink#" addtoken="false">