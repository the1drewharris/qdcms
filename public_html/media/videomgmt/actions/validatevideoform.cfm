<cfobject component="formvalidation" name="objformvalidation">
<cfparam name="form.sample" default="">
<cfparam name="form.deletefiles" default="">
<cfparam name="form.filelist" default="">
<cfparam name="form.subscriableproduct" default="0">

<cfset objformvalidation.set_rules('title','Title','required,max_len[96]')>
<cfif url.action EQ 'actionaddvideo'>
	<cfset objformvalidation.set_rules('video','Video','required')>
	<cfset objformvalidation.set_rules('photoupload','Image','required')>
</cfif>

<cfset objformvalidation.set_rules('link','Link','max_len[128]')>
<cfif form.subscriableproduct EQ 1>
	<cfset objformvalidation.set_rules('subs_price','Default Price','required,numeric,min_val[0],max_value[10000]')>
	<cfif Trim(form.sample) NEQ ''>
		<cfset objformvalidation.set_rules('samplename','Sample Name','max_len[96]')>
	</cfif>
</cfif>

<cfif url.action EQ 'actioneditvideo'>
	<cfif listlen(form.filelist) GT 0>
		<cfloop list="#form.filelist#" index="fileid">
			<cfset objformvalidation.set_rules('title_#fileid#','File Title','required')>
		</cfloop>
	</cfif>
</cfif>
<cfinclude template="/actions/checkforerrorsinform.cfm">