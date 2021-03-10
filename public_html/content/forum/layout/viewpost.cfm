<cfparam name="#url.postid#" default="0">
<cfif url.postid EQ 0>
	<cflocation url="/content/forums/showforums" addtoken="false">
</cfif>
<cfset args=StructNew()>
<cfset args.ds=client.siteurl>
<cfset args.postid=url.postid>
<cfset args.topicdeleted=1>
<cfset args.deleted=-1>
<cfset args.approved=-1>
<cfinvoke component="#application.objforum#" method="getposts"  argumentcollection="#args#" returnvariable="thispost">
<cfinvoke component="#application.objforum#" method="isDeleted" argumentcollection="#args#" returnvariable="result">
<cfset postimages=application.objforum.getImages(client.siteurl,url.postid)>

<cfif thispost.recordcount GT 0>
	<cfset postedon=application.objtimedateconversion.convertdate(thispost.posttime,"mmm dd, yyyy")>
	<cfset postedat=application.objtimedateconversion.converttime(thispost.posttime,"h:mmtt")>
	<cfoutput>
		<h3>Subject: #thispost.postsubject#</h3><br />
		#Application.objforum.displaypost(thispost.posttext)# <br /><br />
		
		<cfloop query="postimages">
			<div class="image-show">
				<img src="#client.imagepath#/#imagepath#">
			</div>
			<div class="clear"></div>
		</cfloop>
		<div class="clear"><br /></div>
		<strong>Posted by:</strong> #thispost.postername# on #postedon# at #postedat#
		<br /><br />
		<cfswitch expression="#result#">
			<cfcase value="1">
				<cfset message="The forum has been deleted. So this content won't show up on the website.">
			</cfcase>
			<cfcase value="2">
				<cfset message="The Topic has been deleted. So this content won't show up on the website.">
			</cfcase>
			<cfcase value="3">
				<cfset message="The Post has been deleted. So this content won't show up on the website.">
			</cfcase>
			<cfcase value="4">
				<cfset message="The Parent Forum has been deleted. So this content won't show up on the website.">
			</cfcase>
			<cfdefaultcase>
				<cfset message="">
			</cfdefaultcase>>
		</cfswitch>
		<cfif len(message)>
			<h2>#message#</h2>
		</cfif>
		<div class="clear"><br /></div>
	</cfoutput>
</cfif>