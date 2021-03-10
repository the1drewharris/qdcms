<cfparam name="url.topicList" default="">

<cfif listLen(url.topicList)>

<cfelse>
	You must select at least one topic.
</cfif>