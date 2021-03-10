<!--- 
Steps
	1. find the correct directory where uploaded files are stored
	2. Get all files in the directory. Exlude all subdirectories
	3. Filter all the script files (html, html, cfm, js)
	4. Add files info into the database. 
--->

<cfif listlen(mysiteurl,'.') LT 3>
	<cfset filedest="#application.basepath#/#mysiteurl#/public_html/files">
<cfelse>
	<cfset parentsite="#listGetAt(mysiteurl,2,'.')#.#listGetAt(mysiteurl,3,'.')#">
	<cfset subsiteFolder=listfirst(mysiteurl,'.')>
	<cfset filedest="#application.basepath#/#parentsite#/public_html/#subsiteFolder#/files">
</cfif>

<cfif directoryExists(filedest)>
	<cfdirectory action="list" directory="#filedest#" type="file" name="allfiles">
	<cfquery name="nonscriptfiles" dbtype="query">
		SELECT NAME FROM allfiles
		WHERE NAME NOT LIKE '%.htm' 
		AND NAME NOT LIKE '%.html'
		AND NAME NOT LIKE '%.cfm' 
		AND NAME NOT LIKE '%.xml'
		AND NAME NOT LIKE '%.js'
	</cfquery>
	<cfif nonscriptfiles.recordcount GT 0>
		<cfset args=StructNew()>
		<cfset args.filedsn=mysiteurl>
		<cfset args.sortorder=0>
		<cfloop query="nonscriptfiles">
			<cfset args.displayname=listfirst(name,'.')>
			<cfset args.serverfilename=name>
			<cfset args.sortorder=args.sortorder + 10>
			<cfinvoke component="#application.objfile#" method="addnonmediafile" argumentcollection="#args#">
		</cfloop>
	</cfif>
<cfelse>
	<cfdirectory action="create" directory="#filedest#" mode="775">
</cfif>