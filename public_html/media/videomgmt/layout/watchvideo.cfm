<cfinvoke component="#application.objvideolib#" method="getvideos" videodsn="#client.siteurl#" vid="#url.v#" status="all" returnvariable="videos">
<cfset filename="#client.devpath#/videos/#videos.videopath#">
<cfif videos.length EQ ""><cfset rt=1><cfelse><cfset rt=0></cfif>
<cfset path='/vplayer'>
<cfoutput>
	<h1>#videos.title#</h1>
	<div class="clear"><br /></div>
	<div class="video-player">
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="480" height="400" align="left">
			<param name="movie" value="#path#/vplayer.swf?vidp=#filename#&xmlp=#path#/videoPlayerSkin.xml&viewid=0&autoplay=0&rt=#rt#&vid=#videos.vid#" />
			<param name="quality" value="high" />
		 	<param name="allowFullScreen" value="true" />
		  	<embed src="#path#/vplayer.swf?vidp=#filename#&xmlp=#path#/videoPlayerSkin.xml&viewid=0&autoplay=0&rt=#rt#&vid=#videos.vid#" allowfullscreen="true" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="480" height="400"></embed>
		</object>
	</div>
	<div class="clear"><br /><br /></div>
	<div class="video-info">
		<cfif Trim(videos.caption) NEQ ''>
			<h3>Caption</h3>
			#videos.caption#
		</cfif>
		<cfif Trim(videos.description) NEQ ''>
			<h3>Description</h3>
			#videos.description#
		</cfif>
	</div>
	<div class="clear"></div>
</cfoutput>