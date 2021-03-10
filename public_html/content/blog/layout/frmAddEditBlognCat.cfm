<cfoutput>
<cfparam  name="url.b" default="0">
<cfparam  name="url.bc" default="0">
<h1>#title#</h1>
<form name="frmnewblog" action="#formaction#" id="form" method="post">
<input type="hidden" name="blogid" value="#url.b#">
<input type="hidden" name="blogCategoryId" value="#url.bc#">

<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
  	<tr>
		<td class="mainWebPageInfo">
	
		<fieldset>
			<label class="name">
				Name of #formtitle#
	    		<input type="text" name="name" value="#application.objtextconversion.setformValue('name')#" />
			</label>
			<div class="clear"></div>
			
			<label class="name">
	    		Title of #formtitle# <em></em><span class="note">Page title used for Search Engines.</span>
				<input type="text" name="Title" value="#application.objtextconversion.setformValue('title')#">
			</label>
			<div class="clear"></div>
	
			
			<label class="name">
			    Keywords <em></em><span class="note">Words related to this page, that can be searched for on Search Engines.</span>
				<textarea name="keywords" cols="30" rows="10" >#application.objtextconversion.setformValue('keywords')#</textarea>
			</label>
			<div class="clear"></div>
		
			<label class="name">
				Description <em></em><span class="note">A few sentences about this page that Search Engines' can use to display in results.</span>
				<textarea name="description" cols="30" rows="10" >#application.objtextconversion.setformValue('description')#</textarea>
				<div class="clear"></div>
			</label>
	
		</fieldset>

		</td>
 	</tr>

 	<tr>
   		<td colspan="2" align="center">
			<input type="submit" name="Submit" value="Update" >
		</td>
 	</tr>
</table>

</form>
</cfoutput>