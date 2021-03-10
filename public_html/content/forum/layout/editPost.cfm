<cfobject component="formvalidation" name="objformvalidation">

<cfif isDefined('form.submit')>
	<cfinclude template="/content/forum/actions/editpost.cfm">
<cfelse>
	<cfinvoke component="#application.objforum#" method="getposts" ds="#client.siteurl#" postid="#url.p#" returnvariable="thispost"> <!--- updated --->
	<cfset postimages=application.objforum.getImages(client.siteurl,url.p)>
	
	<cfset form.subject=thispost.postsubject>
	<cfset form.posttext=application.objforum.smiliestostring(thispost.posttext,client.siteurl)>
	<cfset form.topicid=thispost.topicid>
	<cfif isDefined('CGI.HTTP_REFERER')>
		<cfset client.refererpage=CGI.HTTP_REFERER>
	</cfif>
</cfif>
<cfoutput>
<h3>Edit Post</h3>
#objformvalidation.validation_errors()#
<form id="postform" method="post" action="/cms/content/forum/editpost">
	<input type="hidden" name="postid" value="#url.p#">
	<input type="hidden" name="topicid" value="#objformvalidation.set_value('topicid')#">
	<label for="txtSubject">Subject</label>
	<input type="text" id="txtSubject" style="width: 575px;" name="subject" value="#objformvalidation.set_value('subject')#" />	
	<div style="padding:5px"></div>
	<div id="format-buttons">
		<input type="button" class="button2" accesskey="b" name="addbbcode0" value=" B " style="font-weight:bold; width: 30px" onclick="bbstyle(0)" title="Bold text: [b]text[/b]" />
		<input type="button" class="button2" accesskey="i" name="addbbcode2" value=" i " style="font-style:italic; width: 30px" onclick="bbstyle(2)" title="Italic text: [i]text[/i]" />
		<input type="button" class="button2" accesskey="u" name="addbbcode4" value=" u " style="text-decoration: underline; width: 30px" onclick="bbstyle(4)" title="Underline text: [u]text[/u]" />
		
		<input type="button" class="button2" accesskey="l" name="addbbcode10" value="List" style="width: 40px" onclick="bbstyle(10)" title="List: [list]text[/list]" />
		<input type="button" class="button2" accesskey="o" name="addbbcode12" value="List=" style="width: 40px" onclick="bbstyle(12)" title="Ordered list: [list=]text[/list]" />
		<input type="button" class="button2" accesskey="t" name="addlitsitem" value="[*]" style="width: 40px" onclick="bbstyle(-1)" title="List item: [*]text[/*]" />
		<input type="button" class="button2" accesskey="p" name="addbbcode14" value="Img" style="width: 40px" onclick="bbstyle(14)" title="Insert image: [img]http://image_url[/img]" />
		<input type="button" class="button2" accesskey="w" name="addbbcode16" value="URL" style="text-decoration: underline; width: 40px" onclick="bbstyle(16)" title="Insert URL: [url]http://url[/url] or [url=http://url]URL text[/url]" />
	</div>
	<div style="padding:5px"></div>
	<!--- smileybox should have width attribute --->
	<div id="smiley-box"> 
		<strong>Smilies</strong><br />
		<a href="##" onclick="insert_text(':D', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_e_biggrin.gif" width="15" height="17" alt=":D" title="Very Happy" /></a>
		<a href="##" onclick="insert_text(':)', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_e_smile.gif" width="15" height="17" alt=":)" title="Smile" /></a>
		<a href="##" onclick="insert_text(';)', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_e_wink.gif" width="15" height="17" alt=";)" title="Wink" /></a>
		<a href="##" onclick="insert_text(':(', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_e_sad.gif" width="15" height="17" alt=":(" title="Sad" /></a>
		<a href="##" onclick="insert_text(':o', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_e_surprised.gif" width="15" height="17" alt=":o" title="Surprised" /></a>
		<a href="##" onclick="insert_text(':shock:', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_eek.gif" width="15" height="17" alt=":shock:" title="Shocked" /></a>
	
		<a href="##" onclick="insert_text(':?', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_e_confused.gif" width="15" height="17" alt=":?" title="Confused" /></a>
		<a href="##" onclick="insert_text('8-)', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_cool.gif" width="15" height="17" alt="8-)" title="Cool" /></a>
		<a href="##" onclick="insert_text(':lol:', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_lol.gif" width="15" height="17" alt=":lol:" title="Laughing" /></a>
		<a href="##" onclick="insert_text(':x', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_mad.gif" width="15" height="17" alt=":x" title="Mad" /></a>
		<a href="##" onclick="insert_text(':P', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_razz.gif" width="15" height="17" alt=":P" title="Razz" /></a>
		<a href="##" onclick="insert_text(':oops:', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_redface.gif" width="15" height="17" alt=":oops:" title="Embarrassed" /></a>
		<a href="##" onclick="insert_text(':cry:', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_cry.gif" width="15" height="17" alt=":cry:" title="Crying or Very Sad" /></a>
		<a href="##" onclick="insert_text(':evil:', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_evil.gif" width="15" height="17" alt=":evil:" title="Evil or Very Mad" /></a>
		<a href="##" onclick="insert_text(':twisted:', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_twisted.gif" width="15" height="17" alt=":twisted:" title="Twisted Evil" /></a>
	
		<a href="##" onclick="insert_text(':roll:', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_rolleyes.gif" width="15" height="17" alt=":roll:" title="Rolling Eyes" /></a>
		<a href="##" onclick="insert_text(':!:', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_exclaim.gif" width="15" height="17" alt=":!:" title="Exclamation" /></a>
		<a href="##" onclick="insert_text(':?:', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_question.gif" width="15" height="17" alt=":?:" title="Question" /></a>
		<a href="##" onclick="insert_text(':idea:', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_idea.gif" width="15" height="17" alt=":idea:" title="Idea" /></a>
		<a href="##" onclick="insert_text(':arrow:', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_arrow.gif" width="15" height="17" alt=":arrow:" title="Arrow" /></a>
		<a href="##" onclick="insert_text(':|', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_neutral.gif" width="15" height="17" alt=":|" title="Neutral" /></a>
		<a href="##" onclick="insert_text(':mrgreen:', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_mrgreen.gif" width="15" height="17" alt=":mrgreen:" title="Mr. Green" /></a>
		<a href="##" onclick="insert_text(':geek:', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_e_geek.gif" width="17" height="17" alt=":geek:" title="Geek" /></a>
		<a href="##" onclick="insert_text(':ugeek:', true); return false;"><img src="http://quantumdelta.com/siteimages/smilies/icon_e_ugeek.gif" width="17" height="18" alt=":ugeek:" title="Uber Geek" /></a>	
	</div>
	
	<div style="padding:5px"></div>
			
	<label for="message" class="lblPost">Post Text</label><div style="clear:both"></div> 
	<textarea name="posttext" id="message" rows="15" cols="76" tabindex="3" onselect="storeCaret(this);" onclick="storeCaret(this);" onkeyup="storeCaret(this);" class="inputbox">#objformvalidation.set_value('posttext')#</textarea>
	
	<div class="clear"><br /></div>
	<div class="heading">
		Please note: Uploading new image will update respective images of the post.
	</div> 
	<div class="clear"><br /></div>
	<div class="heading">Accepted image types(gif,jpg,jpeg,png).</div>
	<div class="clear"><br /></div>
	<label class="name">Image 1
		<input type="file" name="image1" size="63">
	</label>
	<div class="clear"><br /></div>
	<label class="name">Image 2
		<input type="file" name="image2" size="63">
	</label>
	<div class="clear"><br /></div>
	<label class="name">Image 3
		<input type="file" name="image3" size="63">
	</label>
	<div class="clear"><br /></div>
	<cfloop query="postimages">
		<div class="image-show">
			<div class="heading">
				Image #currentrow# <a href="/cms/#url.section#/#url.module#/actionremovepostimage/?p=#url.p#&i=#imageid#">Remove</a>
			</div>
			<img src="#client.imagepath#/#imagepath#">
		</div>
		<div class="clear"></div>
	</cfloop>
	<div class="clear"><br /></div>
	<input type="submit" class="btnSubmit" name="submit" value="Submit">
	</div>
</form>
</cfoutput>
