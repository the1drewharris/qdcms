<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('surveyname','Survey Name','required,max_len[96]')>
<cfset objformvalidation.set_rules('sdate','Start Date','required')>
<cfset objformvalidation.set_rules('edate','End Date','required')>
<cfset objformvalidation.set_rules('numberoftimesfor1ip','Allowed number of survey from 1 IP','required,numeric')>
<cfset objformvalidation.set_rules('numberoftimesfornameid','Allowed number of survey from 1 Registered user','required,numeric')>
<cfinclude template="/actions/checkforerrorsinform.cfm">