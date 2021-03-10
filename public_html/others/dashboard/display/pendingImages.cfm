<cfoutput>
<div id="pendingImages">
	<h3><a href="/cms/media/imagemgmt/pendingimages">Pending Images</a></h3>
	<dl>
		<cfloop query="pendingImages">
			<dt class="#imageid#">
				<div class="checkbox">
					<cfif len(title) GTE 14>#left(title,11)#...<cfelse>#title#</cfif>
				</div>
				<div class="holder" style="background-image:url('#client.imagepath#/qdcms/#imagepath#')"></div>
			</dt>
		</cfloop>
	</dl>
	<div class="clear"> </div>
</div>
</cfoutput>