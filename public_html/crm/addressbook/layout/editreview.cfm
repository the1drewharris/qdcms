<cfinvoke component="#application.objreview#" method="getreview" showNoStar="yes" reviewdsn="#client.siteurl#" reviewid="#url.id#" returnVariable="thisreview">
<cfinvoke component="#application.abCFC#" method="getnameofcontact" contactdsn="#client.siteurl#" nameid="#thisreview.authorid#" returnvariable="authorname">
<cfoutput>
	<h1>Edit Review <cfif authorname.recordcount GT 0>by #authorname.username# (#authorname.firstname# #authorname.lastname#)</cfif></h1>
	<form action="/cms/#url.section#/#url.module#/#formaction#" id="form" method="post">
		<input type="hidden" name="contactid" value="#thisreview.reviewofcontactid#">
		<input type="hidden" name="reviewid" value="#thisreview.reviewid#">
		<input type="hidden" name="authorid" value="#thisreview.authorid#">
		<table id="webPageEditorTable"  class="htmform" cellpadding="3" >
		  	<tr>
				<td class="mainWebPageInfo">
					<fieldset>
						<label class="name">Stars
							<select name="stars">
								<cfloop from="0" to="5" index="noofstars">
									<option value="#noofstars#" <cfif thisreview.stars EQ noofstars>Selected</cfif>>#noofstars#</option>
								</cfloop>
							</select>	
						</label>
						<label class="name">Review
							<textarea name="review">#thisreview.review#</textarea>
						</label>
					</fieldset>
				</td>
		 	</tr>
		 	<tr>
		   		<td>
					<input type="submit" name="Submit" value="Update">
				</td>
		 	</tr>
		</table>
	</form>
</cfoutput>