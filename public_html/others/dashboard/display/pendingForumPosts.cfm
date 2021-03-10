<cfoutput>
<div id="pendingPosts">
	<h3>
		<span class="tools">
			<a href="##" class="approvePosts">Approve</a>
			&ndash; 
			<a href="##" class="disapprovePosts">Delete</a>
		</span>
	</h3>
	<dl>
		<cfloop query="unapprovedPosts">
			<dt class="#postid#">
				<a href="##" class="handle">View Post</a> 
				submitted by #POSTERNAME# on #application.objtimedateconversion.convertdate(POSTTIME, 'mmm d, yyyy')#
			</dt>
			<dd>
				<strong>Post:</strong>#application.objforum.displayPost(posttext)#
				<div class="clear"></div>
				<cfset postimages=application.objforum.getImages(client.siteurl,postid)>
				<cfif postimages.recordcount GT 0>
					<cfloop query="postimages">
						<img src="#client.imagepath#/tiny/#imagepath#" />
					</cfloop>
				</cfif>
			</dd>
		</cfloop>
	</dl>
</div>
</cfoutput>