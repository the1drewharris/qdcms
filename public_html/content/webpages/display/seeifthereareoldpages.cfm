<div class="quicknote">
	<cfinvoke component="#application.objwebpage#" method="getOldPages" dsn="#client.siteurl#" returnvariable="myOldPages">
	<cfif NOT myOldPages.recordCount>
		<h1>
			There are currently no pages for this site. 
			<a href="/cms/content/webpages/addwebpage">Click here</a> to add your first page!
		</h1>
		<p>It is really easy, plus every site needs at least one page!</p>
	<cfelse>
		<h1>
			There are currently no QDCMS pages for this site. However, we found pages for this site in a legacy system, 
			<a href="/cms/content/webpages/migratepages">Click here</a> to pull the pages from the legacy system over to QDCMS!
		</h1>
	</cfif>	
</div>	
	