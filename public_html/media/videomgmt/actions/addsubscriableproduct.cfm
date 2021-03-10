<cfset defaultplan=application.objsubscription.getDefaultPlan(client.siteurl)>
<cfset itemname=form.title & " - " & "#defaultplan.term# #defaultplan.termmeasure# subscription">
<cfset pid=application.objproduct.createID(client.siteurl,'Subscriptionplan',itemname,1,0)>
<cfset application.objsubscription.addsubscriptionplans(client.siteurl,id,pid,defaultplan.term,defaultplan.termmeasure,0)>
<cfset application.objproduct.setPrice(client.siteurl,pid,1,form.subs_price)>
<cfif sampleIsUploaded>
	<cfset sampleid=application.objproduct.createID(client.siteurl,'Sample Video',form.samplename,0,0)>
	<cfset application.objvideolib.addsample(client.siteurl,id,samplefile,sampleid)>
</cfif>