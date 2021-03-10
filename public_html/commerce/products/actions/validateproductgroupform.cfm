<cfobject component="formvalidation" name="objformvalidation">
<cfset objformvalidation.set_rules('itemname','Product Group Name','required,max_len[64]')>
<cfif objformvalidation.isValidForm()>
	<cfset args=StructNew()>
	<cfset args.productdsn=client.siteurl>
	<cfset args.itemname=form.itemname>
	<cfif url.action EQ 'actioneditproductgroup'>
		<cfset args.id=form.id>
	</cfif>
	<cfinvoke component="#application.objproduct#" method="checkItemname" argumentcollection="#args#" returnvariable="itemExists">
	<cfif itemExists EQ 1>
		<cfset objformvalidation.addError('Item with name #form.itemname# already exists')>
	</cfif>
</cfif>
<cfinclude template="/actions/checkforerrorsinform.cfm">