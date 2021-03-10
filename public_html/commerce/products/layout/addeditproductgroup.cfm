<cfoutput>
	<cfset temp=application.objtextconversion.setformvalue('subscriable')>
	<cfset checksubscriable="">
	<cfif temp EQ 1><cfset checksubscriable="checked"></cfif>
	
	<cfset temp=application.objtextconversion.setformvalue('startselling')>
	<cfset checkstartselling="">
	<cfif temp EQ 1><cfset checkstartselling="checked"></cfif>
	
	<h1>#title#</h1>
	<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post">
		<input type="hidden" name="id" value="#application.objtextconversion.setFormValue('id')#">
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">Prodcut Group Name
				    		<input type="text" name="itemname" value="#application.objtextconversion.setformValue('itemname')#" />
						</label>
						<label class="checkbox">
							<input type="checkbox" name="subscriable" value="1" #checksubscriable#>Product is subscriable
						</label>
						<label class="checkbox">
							<input type="checkbox" name="startselling" value="1" #checkstartselling#>Sell this product
						</label>
					</fieldset>
				</td>
				<td class="quickWebPageInfo">
					<div class="container">
					</div>
				</td>
		 	</tr>
		 	<tr>
		   		<td colspan="2">
					<input type="submit" name="Submit" value="Submit" >
				</td>
		 	</tr>
		</table>
	</form>
</cfoutput>