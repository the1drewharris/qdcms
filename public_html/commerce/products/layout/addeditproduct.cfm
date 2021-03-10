<cfoutput>
	<cfinvoke component="#application.objproduct#" method="getcategory" productdsn="#client.siteurl#" returnvariable="categories">
	<cfset temp=application.objtextconversion.setformvalue('subscriable')>
	<cfset checksubscriable="">
	<cfif temp EQ 1><cfset checksubscriable="checked"></cfif>
	<cfset temp=application.objtextconversion.setformvalue('startselling')>
	<cfset checkstartselling="">
	<cfif temp EQ 1><cfset checkstartselling="checked"></cfif>
	<cfif url.action EQ 'editproduct'>
		<cfset quantityDisabled="disabled">
	<cfelse>
		<cfset quantityDisabled="">
	</cfif>
	<cfset request.productid="#application.objtextconversion.setFormValue('id')#">
	<h1>#title#</h1>
	<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="#request.productid#">
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">Product Name
				    		<input type="text" name="itemname" value="#application.objtextconversion.setformValue('itemname')#" />
						</label>
						<label class="name">Client Product ID
				    		<input type="text" name="clientproductid" value="#application.objtextconversion.setformValue('clientproductid')#" />
						</label>
						<label class="name">Weight
				    		<input type="text" name="weight" value="#application.objtextconversion.setformValue('weight')#" />
						</label>
						<label class="name">
							Teaser <em></em><span class="note">Short Description</span>
							<textarea name="teaser">#application.objtextconversion.setformvalue('teaser')#</textarea>
						</label>
						<cfif client.siteurl eq "vcientertainment.com">
							<label class="name">Color
					    		<input type="text" name="color" value="#application.objtextconversion.setformValue('color')#" />
							</label>
							<label class="name">Rating
					    		<input type="text" name="rating" value="#application.objtextconversion.setformValue('rating')#" />
							</label>
							<label class="name">Format
					    		<input type="text" name="format" value="#application.objtextconversion.setformValue('format')#" />
							</label>
							<label class="name">Production Year
					    		<input type="text" name="prodyear" value="#application.objtextconversion.setformValue('prodyear')#" />
							</label>
							<label class="name">Netflix ID
					    		<input type="text" name="netflixid" value="#application.objtextconversion.setformValue('netflixid')#" />
							</label>
							<label class="name">Bright Cover Trailer ID
					    		<input type="text" name="brightcovetrailerid" value="#application.objtextconversion.setformValue('brightcovetrailerid')#" />
							</label>
						</cfif>
						<cfset descriptionEditor=Application.fckeditor>
						<cfset descriptionEditor.instanceName="description">
						<cfset descriptionEditor.value=Application.objtextconversion.setformvalue('description')>
						<label class="name">Description
							<cfset descriptionEditor.create()>
						</label>						
						<label class="name">
							Keywords <em></em><span class="note">Words people may use to search for this product.</span>
							<textarea name="attributes">#application.objtextconversion.setformvalue('attributes')#</textarea>
						</label>
						<cfset imageids=Application.objtextconversion.setformValue('productimageids')>
						<input type="hidden" id="productimageids" name="productimageids" value="#imageids#">
						<cfif listlen(imageids) GT 0>
							<ul id="sortableimages">
							<cfloop list="#imageids#" index="imageid">
								<cfset imagepath=application.objimagegallery.getimagepath(client.siteurl,imageid)>
								<li id="#imageid#">
									<span class="handle" style="cursor:move">
										<img src="#client.imagepath#/qdcms/#imagepath#">
									</span>
								</li>
							</cfloop>
							</ul>
						</cfif>
					</fieldset>
				</td>
				<td class="quickWebPageInfo">
					<div class="container">
						<div class="justLabel">
							<span class="left">Quantity</span>
							<span class="right">
							<input type="text" name="quantity" value="#application.objtextconversion.setformvalue('quantity')#" #quantityDisabled#>
							</span>
						</div>
						
						<div class="clear"></div>
						<input type="checkbox" name="subscriable" value="1" #checksubscriable#><span class="justLabel">Product is subscribable</span>
						<div class="clear"><br /></div>
						
						<input type="checkbox" name="startselling" value="1" #checkstartselling#><span class="justLabel">Sell this product</span>
						<div class="clear"><br /></div>
						
						<cfinclude template="../display/productPriceForm.cfm">
						<div class="clear"> </div>
						
						<cfinclude template="../display/productCategoriesForm.cfm">				
						<div class="clear"> </div>
						
						<cfinclude template="../display/productImageForm.cfm"> 
						<input type="submit" name="Submit" value="Submit" >
					</div>
				</td>
		 	</tr>
		 	<tr>
		   		<td colspan="2">
					
				</td>
		 	</tr>
		</table>
	</form>
</cfoutput>