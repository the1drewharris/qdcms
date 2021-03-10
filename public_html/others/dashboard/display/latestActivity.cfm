<cfinvoke component="#application.objtracking#" method="getDashStreams" ds="#client.siteurl#" maxrows="15" returnvariable="myDashStreams">
<h2>Latest site admin activity in QDcms</h2>

<cfif myDashStreams.recordCount LTE 0>
	<div class="quicknote">
		There are not currently any recent changes for this website. As you make changes in QDCMS this message will disappear. 
	</div>
<cfelse>
	<ul id="latestActivity">
		<cfoutput query="myDashStreams">
			<li>
			#stream#  -#application.objtimedateconversion.getDateDiffSentence(timeDate)#
			</li>
		</cfoutput>
	</ul>
</cfif>