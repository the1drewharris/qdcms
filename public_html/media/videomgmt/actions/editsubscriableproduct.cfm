<cfset isSubscriable=application.objvideolib.isSubscriableProduct(client.siteurl,form.vid)>
<cftransaction>
	<cfif isSubscriable EQ 0>
		<cfif form.subscriableproduct EQ 1>
			<cfset defaultplan=application.objsubscription.getDefaultPlan(client.siteurl)>
			<cfset itemname=form.title & " - " & "#defaultplan.term# #defaultplan.termmeasure# subscription">
			<cfset pid=application.objproduct.createID(client.siteurl,'Subscriptionplan',itemname,1,0)>
			<cfset application.objsubscription.addsubscriptionplans(client.siteurl,id,pid,defaultplan.term,defaultplan.termmeasure,0)>
			<cfset application.objproduct.setPrice(client.siteurl,pid,1,form.subs_price)>
			<cfif sampleIsUploaded>
				<cfset sampleid=application.objproduct.createID(client.siteurl,'Sample Video',form.samplename,0,0)>
				<cfset application.objvideolib.addsample(client.siteurl,form.vid,samplefile,sampleid)>
			</cfif>
		</cfif>
	<cfelse>
		<cfif form.subscriableproduct EQ 0>
			<cfset application.objsubscription.makeVideoUnsubscriable(client.siteurl,form.vid)>
		<cfelse>
			<cfset application.objsubscription.setRetailPrice(client.siteurl,form.vid,form.subs_price)>
			<cfif sampleIsUploaded>
				<cfset sampleid=application.objproduct.createID(client.siteurl,'Sample Video',form.samplename,0,0)>
				<cfset application.objvideolib.addsample(client.siteurl,form.vid,samplefile,sampleid)>
			<cfelseif sampleNameHasBeenChanged>
				<cfset application.objproduct.updateName(client.siteurl,form.sampleid,form.samplename)>
			</cfif>
		</cfif>
	</cfif>
</cftransaction>
<cfinclude template="/actions/tracking.cfm">