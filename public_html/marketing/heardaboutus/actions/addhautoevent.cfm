<cfset args=StructNew()>
<cfset args.eventid=url.e>
<cfset args.haudsn=client.siteurl>
<cfset mylist=ArrayNew(1)>
<cfset i=1>
<cfloop index="TheField" list="#Form.FieldNames#">
	<cfset mylist[#i#]=#Form[TheField]#>
	<cfset i++>
</cfloop>
<cfset addlist=ArrayToList(mylist)>
<cfloop list="#addlist#" index="i">
	<cfset parentid=application.objhau.getparent(client.siteurl,i)>
	<cfif parentid NEQ 0>
		<cfset result=ListFind(addlist,parentid)>
		<cfif result EQ 0>
			<cfset addlist=ListAppend(addlist,parentid)>
		</cfif>
	</cfif>
</cfloop>
<cfset args.haulist=addlist>
<cftransaction>
	<cfinvoke component="#application.objhau#" method="deletehau2event" argumentcollection="#args#">
	<cfif isDefined('Form.FieldNames')>
		<cfinvoke component="#application.objhau#" method="addhaulisttoevent" argumentcollection="#args#">
	</cfif>
</cftransaction>
<cfinclude template="/actions/tracking.cfm">
<cflocation url="/cms/marketing/heardaboutus/hautoevent/?e=#url.e#">


