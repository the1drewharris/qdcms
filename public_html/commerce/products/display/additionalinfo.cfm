<cfparam name="url.discountappliesto" default="1">
<cfoutput>
<cfif url.discountappliesto EQ 1><!--- Total Purchase --->
	<label class="name">Total Should be Greater than
		<input type="text" name="totalprice" value="0">
	</label>

<cfelseif url.discountappliesto EQ 2><!--- Video/Audio Category --->
	<cfinvoke component="videolib" method="getcategory" videodsn="#client.siteurl#" mediatypeid="12" returnvariable="videocategory">
	<label class="name">Select Category
		<select name="videocategoryid">
			<cfloop query="videocategory">
			<option value="#videocategoryid#">#category#</option>
			</cfloop>
		</select>
	</label>
	
<cfelseif url.discountappliesto EQ 3><!--- Product Category (Non Video/Audio) --->
	<cfinvoke component="product" method="getcategory" productdsn="#client.siteurl#" returnvariable="category">
	<label class="name">Select Category
		<select name="categoryid">
			<cfloop query="category">
			<option value="#categoryid#">#category#</option>
			</cfloop>
		</select>
	</label>

<!--- Any Item --->

<cfelseif url.discountappliesto EQ 5><!--- Any non Video/Audio Product --->
	<input type="hidden" name="categoryid" value="0">
	
<cfelseif url.discountappliesto EQ 6><!--- Any Video/Audio Product --->
	<input type="hidden" name="videocategoryid" value="0">
	
<cfelseif url.discountappliesto EQ 7><!--- A Particular Video/Audio Item --->
	<cfquery name="videoproducts" datasource="#client.siteurl#">
		SELECT ID, ITEMNAME FROM IDPOOL WHERE IDFOR='Subscriptionplan'
	</cfquery>
	<label class="name">Select Item
		<select name="id">
			<cfloop query="videoproducts">
			<option value="#id#">#itemname#</option>
			</cfloop>
		</select>
	</label>
	
<cfelseif url.discountappliesto EQ 8><!--- A Particular Non Video/Audio Item --->
	<cfquery name="products" datasource="#client.siteurl#">
		SELECT ID, ITEMNAME FROM IDPOOL WHERE IDFOR='Product'
	</cfquery>
	<label class="name">Select Item
		<select name="id">
			<cfloop query="products">
			<option value="#id#">#itemname#</option>
			</cfloop>
		</select>
	</label>
</cfif>
</cfoutput>
<!--- 
<option value="1">Total Purchase</option>
<option value="2">Video/Audio Category</option>
<option value="3">Product Category (Non Video/Audio)</option>
<option value="4">Any Item</option>
<option value="5">Any non Video/Audio Product</option>
<option value="6">Any Video/Audio Product</option>
<option value="7">A Particular Video/Audio Item</option>
<option value="8">A Particular Non Video/Audio Item</option>
 --->