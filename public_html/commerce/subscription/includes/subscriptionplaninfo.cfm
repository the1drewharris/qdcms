<cfif NOT thereAreErrors>
	<cfparam name="url.s" default="0">
	<cfset allIsWell=TRUE>
	<cfif isNumeric(url.s)>
		<cfinvoke component="#application.objsubscription#" method="getSubscriptionPlans" subscriptiondsn="#client.siteurl#" subscriptionplanid="#url.s#" returnvariable="thisSubscriptionPlan">
		<cfif thisSubscriptionPlan.recordcount EQ 1>
			<cfset Session.formValues['subscriptionplanid']=thisSubscriptionPlan.ID>
			<cfset Session.formValues['subscriableid']=thisSubscriptionPlan.SUBSCRIABLEID>
			<cfset Session.formValues['itemname']=thisSubscriptionPlan.ITEMNAME>
			<cfif thisSubscriptionPlan.stopselling EQ 1>
				<cfset Session.formValues['startselling']=0>
			<cfelse>
				<cfset Session.formValues['startselling']=1>
			</cfif>
			<cfset Session.formValues['term']=thisSubscriptionPlan.TERM>
			<cfset Session.formValues['termmeasure']=thisSubscriptionPlan.TERMMEASURE>
		<cfelse>
			<cfset allIsWell=FALSE>
		</cfif>
	<cfelse>
		<cfset allIsWell=FALSE>
	</cfif>
	<cfif NOT allIsWell>
		<cflocation url="/cms/#url.section#/#url.module#/subscriptionplans" addtoken="false">
	</cfif>
</cfif>