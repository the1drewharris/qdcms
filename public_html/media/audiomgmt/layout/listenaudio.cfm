<cfinvoke component="#application.objvideolib#" method="getvideos" videodsn="#client.siteurl#" vid="#url.v#" mediatypeid="2" status="all" returnvariable="thisaudio">
<cfset filename="#client.devpath#/podcast/#thisaudio.videopath#">
<cfset path='/player'>
<cfoutput>
	<h1>#thisaudio.title#</h1>
	<div class="clear"><br /></div>
	<div class="video-player">
		<object type="application/x-shockwave-flash" data="#path#/player.swf" id="audioplayer1" height="24" width="290">
			<param name="movie" value="#path#/player.swf">
			<param name="FlashVars" value="playerID=1&amp;bg=0xCDDFF3&amp;leftbg=0x357DCE&amp;lefticon=0xF2F2F2&amp;rightbg=0xF06A51&amp;rightbghover=0xAF2910&amp;righticon=0xF2F2F2&amp;righticonhover=0xFFFFFF&amp;text=0x357DCE&amp;slider=0x357DCE&amp;track=0xFFFFFF&amp;border=0xFFFFFF&amp;loader=0xAF2910&amp;soundFile=#filename#" />
			<param name="quality" value="high">
			<param name="menu" value="false">
			<param name="wmode" value="transparent">
		</object>
	</div>
	<div class="clear"><br /><br /></div>
	<div class="video-info">
		<cfif Trim(thisaudio.caption) NEQ ''>
			<h3>Caption</h3>
			#thisaudio.caption#
		</cfif>
		<cfif Trim(thisaudio.description) NEQ ''>
			<h3>Description</h3>
			#thisaudio.description#
		</cfif>
	</div>
	<div class="clear"></div>
</cfoutput>