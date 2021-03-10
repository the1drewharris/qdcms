<cfinvoke component="#application.objreview#" method="getReviewbyNameid" showNoStar="yes" nameid="#url.id#" reviewdsn="#client.siteurl#" returnvariable="reviews">

<table class="datagrid">
<cfoutput query="reviews">
<tr><td>
<p>
	<strong>Review by: #username# (#lastname#, #firstname#)</strong><br />
	<a href="/cms/crm/addressbook/editreview/?id=#reviewid#">Edit</a> | 
	<a href="/cms/crm/addressbook/deletereview/?id=#reviewid#">Delete</a><br />
	<strong>Stars: #stars#</strong><br />
	#review#<br />
</p>
<hr />
</td></tr>
</cfoutput>
</table>