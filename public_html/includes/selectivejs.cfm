<script type="text/javascript" src="/js/mootools.v1.2.js"></script>
<!-- Is this loading -->
<cfif listfindnocase("addcoupon,editcoupon,addsurvey,editsurvey,addevent,editevent,addadvertisement,editadvertisement,advancedsearch,addnewsletter,editnewsletter,addcontest,editcontest,addblogentry,editblogentry,viewBlogEntries",url.action) GT 0>
	<script type="text/javascript" src="/js/calendar.js"></script>
</cfif>

<cfif listfindnocase("showsections",url.action) GT 0>
	<script type="text/javascript" src="/js/lib/administration/section/default.js"></script>
</cfif>

<cfif listfindnocase("showmodules",url.action) GT 0>
	<script type="text/javascript" src="/js/lib/administration/module/default.js"></script>
</cfif>

<cfif listfindnocase("addproduct,editproduct,notes,addevent,editevent,addwebpage,editwebpage,addcontact,editcontact,showincident,addnewsletter,editnewsletter,addblogentry,editblogentry,addnewsite,editsite",url.action) GT 0>
	<script type="text/javascript" src="/js/formSlider.js"></script>
</cfif>

<cfif listfindnocase("addnewsite,editsite",url.action) GT 0>
	<script type="text/javascript">
		window.addEvent("domready", function()
		{
			var advSSpecs = new formSlider('advSSpecsDL', {duration: 600, titleEl: 'dt', defaultState: 'visible'});
		})
	</script>	
</cfif>

<cfif url.module EQ "products">
	<script type="text/javascript" src="/js/sorttable.js"></script>
</cfif>

<cfif listfindnocase("addcontact,editcontact",url.action) GT 0>
		<script type="text/javascript" src="/js/state-select.js"></script>
</cfif>

<cfif url.module EQ "blog">
	<cfif listfindnocase('viewPendBlogComments,viewBlogs,viewBlogCategories,viewBlogEntries',url.action) GT 0>
		<script type="text/javascript" src="/js/lib/content/blog/default.js"></script>
	</cfif>
	<cfif url.action EQ "viewBlogEntries">
		<script type="text/javascript">	
			 window.addEvent('domready', function() 
			 { 
			 	myCal = new Calendar({ dateposted: { dateposted: 'm/d/Y'}}, { pad: 0 });
			 })
		</script>
	</cfif>

	<cfif listfindnocase("addblogentry,editblogentry",url.action) GT 0>
		<script type="text/javascript">	
			 window.addEvent('domready', function() 
			 { 
			 	myCal = new Calendar({ publishdate: { publishdate: 'm/d/Y'}}, { pad: 0 });
			 	var advancedDL = new formSlider('advancedDL', {duration: 600});
			 })
		</script>
	</cfif>
</cfif>

<cfif url.module EQ "forum">
	<cfif listfindnocase('showForums,showtopics,showposts,deletedforums,deletedTopics,deletedPosts,reportedPosts',url.action) GT 0>
		<script type="text/javascript" src="/js/lib/content/forum/default.js"></script>
	</cfif>
	<cfif listfindnocase('editPost',url.action)>
		<script type="text/javascript">
			// <![CDATA[
			var form_name = 'postform';
			var text_name = 'message';
			var load_draft = false;
			var upload = false;
		
			// Define the bbCode tags
			var bbcode = new Array();
			var bbtags = new Array('[b]','[/b]','[i]','[/i]','[u]','[/u]','[quote]','[/quote]','[code]','[/code]','[list]','[/list]','[list=]','[/list]','[img]','[/img]','[url]','[/url]','[flash=]', '[/flash]','[size=]','[/size]');
			var imageTag = false;
		
			// Helpline messages
			var help_line = {
				b: 'Bold text: [b]text[/b]',
				i: 'Italic text: [i]text[/i]',
				u: 'Underline text: [u]text[/u]',
				q: 'Quote text: [quote]text[/quote]',
				c: 'Code display: [code]code[/code]',
				l: 'List: [list]text[/list]',
				o: 'Ordered list: [list=]text[/list]',
				p: 'Insert image: [img]http://image_url[/img]',
				w: 'Insert URL: [url]http://url[/url] or [url=http://url]URL text[/url]',
				a: 'Inline uploaded attachment: [attachment=]filename.ext[/attachment]',
				s: 'Font colour: [color=red]text[/color]  Tip: you can also use color=#FF0000',
				f: 'Font size: [size=85]small text[/size]',
				e: 'List: Add list element',
				d: 'Flash: [flash=width,height]http://url[/flash]'
					}
		
			var panels = new Array('options-panel', 'attach-panel', 'poll-panel');
			var show_panel = 'options-panel';
		// ]]>
		</script>
		<script type="text/javascript" src="http://quantumdelta.com/js/editor.js"></script>
		<script type="text/javascript" src="http://quantumdelta.com/js/mootools.v1.11.js"></script>
	</cfif>
</cfif>

<cfif url.module EQ "contest">
	<cfif listfindnocase('showcontests',url.action) GT 0>
		<script type="text/javascript" src="/js/lib/content/contest/default.js"></script>
	</cfif>
	<cfif listfindnocase('addcontest,editcontest',url.action) GT 0>
		<script type="text/javascript">	
			 window.addEvent('domready', function() 
			 { 
			 	myCal = new Calendar({ startdate: { startdate: 'm/d/Y'}, enddate: { enddate: 'm/d/Y'}}, { pad: 0 });
			 })
		</script>
	</cfif>
</cfif>

<cfif url.module EQ "links">
	<cfif listfindnocase('showlinks',url.action) GT 0>
		<script type="text/javascript" src="/js/lib/content/links/default.js"></script>
	</cfif>
</cfif>

<cfif url.module EQ "filemgmt">
	<cfif listfindnocase('showfiles',url.action) GT 0>
		<script type="text/javascript" src="/js/lib/media/filemgmt/default.js"></script>
	</cfif>
</cfif>

<cfif url.module EQ "newsletter">
	<cfif listfindnocase('addnewsletter,editnewsletter',url.action) GT 0>
		<script type="text/javascript">	
			 window.addEvent('domready', function() 
			 { 
			 	myCal = new Calendar({ senddate: { senddate: 'm/d/Y'}}, { pad: 0 });
			 	var includeGroups = new formSlider('includeGroups', {duration: 600, titleEl: 'dt', defaultState: 'hide'});
			 	var excludeGroups   = new formSlider('excludeGroupsDL', {useTitleEl: 'no', defaultState: 'hide'});
				excludeGroups.toggleSlide('excludeGroupsDT');
				
				$('sel_all').addEvent('click', function()
				{
					if($('sel_all').get('checked')==true)
					{
						$$('.sel_checkbox').set('checked', true);
					}
					else
					{
						$$('.sel_checkbox').set('checked',false);
					}
				});
			 });
		</script>
	<cfelseif listfindnocase('shownewsletters,managetemplates',url.action) GT 0>
		<script type="text/javascript" src="/js/lib/marketing/newsletter/default.js"></script>
	</cfif>
</cfif>

<cfif url.module EQ "users">
	<cfif url.action EQ 'editpermission'>
		<script type="text/javascript" src="/js/lib/administration/users/default.js"></script>
	</cfif>
</cfif>

<cfif url.module EQ 'addressbook'>
	<cfif listfindnocase('addcontact,editcontact',url.action) GT 0>
		<script type="text/javascript">	
			 window.addEvent('domready', function() 
			 { 
			 	var email   = new formSlider('emailInfoDL', {useTitleEl: 'no', defaultState: 'hide'});
				email.toggleSlide('emailInfoDT');
				var personal   = new formSlider('personalInfoDL', {useTitleEl: 'no', defaultState: 'hide'});
				personal.toggleSlide('personalInfoDT');
				var im   = new formSlider('IMinfoDL', {useTitleEl: 'no', defaultState: 'hide'});
				im.toggleSlide('IMinfoDT');
				var social   = new formSlider('SocialInfoDL', {useTitleEl: 'no', defaultState: 'hide'});
				social.toggleSlide('SocialInfoDT');
			 })
		</script>
	</cfif>
	
	<cfif listfindnocase('advancedsearch',url.action) GT 0>
		<script type="text/javascript">	
			 window.addEvent('domready', function() 
			 { 
			 	myCal = new Calendar({ startdate: { startdate: 'Y/m/d'}, enddate: { enddate: 'Y/m/d'}}, { pad: 0 });
			 })
		</script>
	</cfif>
	
	<cfif listfindnocase('showcontacts,searchcontacts,finddups',url.action) GT 0>
		<script type="text/javascript">	
			window.addEvent('domready', function()
			{
				var contactarr = new Array();
				<cfif url.action NEQ 'finddups' AND url.e EQ 0 AND url.c NEQ 1>
					$('albumsQuickJump').addEvent('change', function() {
						var groupid=$('albumsQuickJump').value;
						location.href='/cms/crm/addressbook/searchcontacts/?g=' + groupid;
					});
				</cfif>
				
				<cfif contacts.recordcount GT 0>
					<cfif url.g NEQ -2>
					$('doDelete').addEvent('click',function(){
						getCheckedContacts();
						if(contactarr.length>0){
							if(contactarr.length==1)
							{
								var c=' contact?';
							}
							else{
								var c=' contacts?';
							}
							var confirmation='Are you sure you want to delete ' + contactarr.length + c;
							var sure=confirm(confirmation);
							if(sure) 
							{
								var ids=contactarr.toString();
								location.href='/cms/crm/addressbook/deletecontacts/?contactlist=' + ids;
							}					
						}
					});
					<cfelse>
						$('restoreContacts').addEvent('click',function(){
							getCheckedContacts();
							if(contactarr.length>0)
							{
								if(contactarr.length==1)
								{
									var c=' contact?';
								}
								else{
									var c=' contacts?';
								}
								var confirmation='Are you sure you want to restore ' + contactarr.length + c;
								var sure=confirm(confirmation);
								if(sure)
								{
									var ids=contactarr.toString();
									location.href='/cms/crm/addressbook/restorecontacts/?contactlist=' + ids;
								}
							}
						});
					</cfif>
					
					<cfif url.c EQ 1>
						$('copycontacts').addEvent('click',function(){
							getCheckedContacts();
							var checkedgroups=getCheckedGroups();
							if(contactarr.length>0)
							{
								var ids=contactarr.toString();
								var req = new Request({
									method: 'post',
									data: {'ids' : ids, 'groups' : checkedgroups},
									url: '/cms/crm/addressbook/actioncopycontacts',
									onComplete: function(response){alert(response)}
								}).send();
							}
						});
					</cfif>
					
					<cfif pageHasMapIcons>
						var mapicons=$('addressBookContainer').getElements('a[id^=viewmapof]');
						mapicons.each(function(el)
						{
							el.addEvent('click', function(){
								var userid=this.getProperty('id').replace('viewmapof','');
								var href='/cms/crm/addressbook/viewmap/?id='+userid;
								window.open(href,'View Map','width=660,height=425');
							})
						});
					</cfif>
					
					<cfif url.c EQ 1>
						var getCheckedGroups=function()
						{
							var grouparr = new Array();
							var checkboxes=$('groupoptions').getElements('input[id^=group_]');
							var id=0;
							checkboxes.each(function(el)
							{
								if(el.checked==true)
								{
									grouparr[id]=el.getProperty('id').replace('group_','');
									id++;
								}
								
							})
							var grouplist=grouparr.toString();
							return(grouplist);
						}
					</cfif>
					
					var getCheckedContacts=function()
					{
						contactarr = new Array();
						var checkboxes=$('addressBookContainer').getElements('input[id^=user]');
						var id=0;
						checkboxes.each(function(el)
						{
							if(el.checked==true)
							{
								contactarr[id]=el.getProperty('id').replace('user_','');
								id++;
							}
						})
					}
					
					var check_All=function(do_check)
					{
						var checkboxes=$('addressBookContainer').getElements('input[id^=user]');
						checkboxes.each(function(el) { 
							el.set('checked',do_check)
							});
					}
					
					do_check = false;
					
					$('checkAll').addEvent('click', function(e){
						e.stop();
						if(do_check) {
							do_check = false;
							this.getElement('img').setProperty('src','/siteimages/icon-select-all-gallery.png');
							check_All(do_check);
						} else {
							do_check = true;
							this.getElement('img').setProperty('src','/siteimages/icon-deselect-all-gallery.png');
							check_All(do_check);
						}
					});	
				</cfif>
			})
		</script>
	</cfif>
	
	<cfif listfindnocase('notes',url.action) GT 0>
		<script type="text/javascript">
			window.addEvent('domready', init);
			function init() {
				var viewNotes   = new formSlider('viewNotesDL', {duration: 600, titleEl: 'dt', defaultState: 'hide'});
				viewNotes.toggleSlide('viewNotesDT');
			}
		</script>
	</cfif>
	
	<cfif listfindnocase('finddups',url.action) GT 0>
		<script type="text/javascript">	
			window.addEvent('domready', function()
			{
				$('byname').addEvent('click', function() {
					var duplicate=$('byname').value;
					location.href='/cms/crm/addressbook/finddups/?d=' + duplicate;
				});
				
				$('byaddress').addEvent('click', function() {
					var duplicate=$('byaddress').value;
					location.href='/cms/crm/addressbook/finddups/?d=' + duplicate;
				});
				
				$('byusername').addEvent('click', function() {
					var duplicate=$('byusername').value;
					location.href='/cms/crm/addressbook/finddups/?d=' + duplicate;
				});
				
				$('byclientuserid').addEvent('click', function() {
					var duplicate=$('byclientuserid').value;
					location.href='/cms/crm/addressbook/finddups/?d=' + duplicate;
				});
				
				$('byhemail').addEvent('click', function() {
					var duplicate=$('byhemail').value;
					location.href='/cms/crm/addressbook/finddups/?d=' + duplicate;
				});
				
				$('bywemail').addEvent('click', function() {
					var duplicate=$('bywemail').value;
					location.href='/cms/crm/addressbook/finddups/?d=' + duplicate;
				});
			})
		</script>
	</cfif>
	
	<cfif url.action EQ "addtoaddressbook">
		<script type="text/javascript" src="/js/lib/crm/addressbook/addtoab.js"></script>
	</cfif>
</cfif>

<cfif url.module EQ 'admanagement'>
	<cfif listfindnocase('addadvertisement,editadvertisement',url.action) GT 0>
		<script type="text/javascript">	
			 window.addEvent('domready', function() 
			 { 
			 	myCal = new Calendar({ startdate: { startdate: 'Y/m/d'}, enddate: { enddate: 'Y/m/d'}}, { pad: 0 });
			 })
		</script>
	</cfif>
</cfif>

<cfif url.module EQ 'webpages'>
	<script type="text/javascript" src="/js/lib/content/webpages/default.js"></script>
	
	<!--- <script>
			window.addEvent('domready', function()
			{
				var checkBoxes = $('managePagesTable').getElements('input[id^=wp]');
					do_check = false;
					$('selectAll').checked = false;
					checkBoxes.each(function(el) { 
						checkItem(el,do_check);
						el.addEvent('click', function(el) {
							if(this.checked) checkItem(this,true);
							else checkItem(this,false);
						});	
					});
					
					$('selectAll').addEvent('click', function(){
						if(this.checked) { do_check = true; }
						else { do_check = false; }
						checkBoxes.each(function(el) { checkItem(el,do_check) });
					});
					
					if($('delete')) {
						$('delete').addEvent('click', function(el) {
							checkedString = checkedArray.toString();
							$('delete').setProperty('href','/cms/content/webpages/delete/?wpList=' + checkedString);
						});
					}
					
					if($('truedelete')) {
						$('truedelete').addEvent('click', function(el) {
							checkedString = checkedArray.toString();
							$('truedelete').setProperty('href','/cms/content/webpages/truedelete/?wpList=' + checkedString);
						});
					}
					
					if($('copy')) {
						$('copy').addEvent('click', function(el) {
							checkedString = checkedArray.toString();
							$('copy').setProperty('href','/cms/content/webpages/copy/?wpList=' + checkedString);
						});
					}
					
					if($('deleteWPTemplate')) {
						$('deleteWPTemplate').addEvent('click', function(el) {
							checkedString = checkedArray.toString();
							$('deleteWPTemplate').setProperty('href','/cms/content/webpages/deleteWPTemplate/?templateList=' + checkedString);
						});
					}
					
					if($('copyWPTemplate')) {
						$('copyWPTemplate').addEvent('click', function(el) {
							checkedString = checkedArray.toString();
							$('copyWPTemplate').setProperty('href','/cms/content/webpages/copyWPTemplate/?templateList=' + checkedString);
						});
					}
					
				}
				
					checkedArray = new Array();
				
					var checkItem = function(el,checked) {
						itemID = el.getProperty('id').replace('wp','');
						el.set('checked',checked);
					
						if(el.checked) {
							for(ID in checkedArray) {
								if(checkedArray[ID] == itemID) {
									IDExists = 1;
									break;
								} else
									IDExists = 0;
							}
							if(IDExists == 0)
								checkedArray.push(itemID);
						} else 
							checkedArray.erase(itemID);
							
					}
			})
		</script> --->
	
	<cfif listfindnocase('managewptemplates.cfm',url.action) GT 0>
		<script type="text/javascript" src="/js/lib/content/webpages/default.js"></script>
	</cfif>
	
	<cfif listfindnocase('addwebpage,editwebpage',url.action) GT 0>
		<script type="text/javascript">	
			 window.addEvent('domready', function() 
			 { 
			 	var advancedDL = new formSlider('advancedDL', {duration: 600, defaultState: 'hide'});
			 	<cfif url.action EQ 'editwebpage'>
				 	$('previousVersions').addEvent('change', function() {
						window.location = "/cms/content/webpages/editwebpage?w=<cfoutput>#url.w#</cfoutput>&createdon=" + this.value;
					});
				</cfif>
				<cfif url.action EQ 'viewWebPages'>
					var checkBoxes = $('managePagesTable').getElements('input[id^=wp]');
					do_check = false;
					$('selectAll').checked = false;
					checkBoxes.each(function(el) { 
						checkItem(el,do_check);
						el.addEvent('click', function(el) {
							if(this.checked) checkItem(this,true);
							else checkItem(this,false);
						});	
					});
					
					$('selectAll').addEvent('click', function(){
						if(this.checked) { do_check = true; }
						else { do_check = false; }
						checkBoxes.each(function(el) { checkItem(el,do_check) });
					});
					
					if($('delete')) {
						$('delete').addEvent('click', function(el) {
							checkedString = checkedArray.toString();
							$('delete').setProperty('href','/cms/content/webpages/delete/?wpList=' + checkedString);
						});
					}
					
					if($('truedelete')) {
						$('truedelete').addEvent('click', function(el) {
							checkedString = checkedArray.toString();
							$('truedelete').setProperty('href','/cms/content/webpages/truedelete/?wpList=' + checkedString);
						});
					}
					
					if($('copy')) {
						$('copy').addEvent('click', function(el) {
							checkedString = checkedArray.toString();
							$('copy').setProperty('href','/cms/content/webpages/copy/?wpList=' + checkedString);
						});
					}
					
					if($('deleteWPTemplate')) {
						$('deleteWPTemplate').addEvent('click', function(el) {
							checkedString = checkedArray.toString();
							$('deleteWPTemplate').setProperty('href','/cms/content/webpages/deleteWPTemplate/?templateList=' + checkedString);
						});
					}
					
					if($('copyWPTemplate')) {
						$('copyWPTemplate').addEvent('click', function(el) {
							checkedString = checkedArray.toString();
							$('copyWPTemplate').setProperty('href','/cms/content/webpages/copyWPTemplate/?templateList=' + checkedString);
						});
					}
					
				}
				
					checkedArray = new Array();
				
					var checkItem = function(el,checked) {
						itemID = el.getProperty('id').replace('wp','');
						el.set('checked',checked);
					
						if(el.checked) {
							for(ID in checkedArray) {
								if(checkedArray[ID] == itemID) {
									IDExists = 1;
									break;
								} else
									IDExists = 0;
							}
							if(IDExists == 0)
								checkedArray.push(itemID);
						} else 
							checkedArray.erase(itemID);
							
					}
				</cfif>
			 })
		</script>
		
	</cfif>
</cfif>

<cfif url.module EQ "events">
	<cfif listfindnocase("addevent,editevent",url.action) GT 0>
		<script type="text/javascript" src="/js/getinfo.js"></script>
		<script type="text/javascript">	
			 window.addEvent('domready', function() 
			 { 
			 	<!--- sliders --->
				var email = new formSlider('emailDL', {useTitleEl: 'no', defaultState: 'hide'});
				email.toggleSlide('emailDT');
				var pricing = new formSlider('pricingDL', {useTitleEl: 'no', defaultState: 'hide'});
				pricing.toggleSlide('pricingDT');
				var location = new formSlider('locationDL', {useTitleEl: 'no', defaultState: 'hide'});
				location.toggleSlide('locationDT');
				var contact = new formSlider('contactDL', {useTitleEl: 'no', defaultState: 'hide'});
				contact.toggleSlide('contactDT');
				<!--- End: sliders --->
				
				myCal1 = new Calendar({
					startdate: {startdate: 'm/d/Y'}
				});
				
				myCal2 = new Calendar({
					enddate: { enddate: 'm/d/Y'}
				});
			
				myCal3 = new Calendar({
					repeatDate: { repeatDate: 'm/d/Y'}
				});
				
				myCal4 = new Calendar({
					regstart: {regstart: 'm/d/Y'}
				});
				
				myCal5 = new Calendar({
					regend: { regend: 'm/d/Y'}
				});
				
				myCal6 = new Calendar({
					alldaydate: { alldaydate: 'm/d/Y'}
				});
			 })
		</script>
	<cfelseif listfindnocase("pendingevents",url.action) GT 0>
		<script type="text/javascript" src="/js/eventdetail.js"></script>
	<cfelseif listfindnocase("listcategories",url.action) GT 0>
		<script type="text/javascript" src="/js/lib/crm/events/default.js"></script>
	<cfelseif listfindnocase("showevents",url.action) GT 0>
		<script type="text/javascript" src="/js/dateFormat.js"></script>
		<script type="text/javascript" src="/js/lib/clientcide/clientcidePopupWaiter.js"></script>
		<script type="text/javascript" src="/js/mooECal.0.2.1.js"></script>
		<script type="text/javascript" src="/js/lib/crm/events/cal.js"></script>
		<script type="text/javascript" src="/js/jquery.js"></script>		
		<script type="text/javascript">var $j = jQuery.noConflict();</script><!--- Changes jQuery function listener prefix to $j instead of $. This is because mootools listener prefix is $ --->
		<script type="text/javascript" src="/js/thickbox.js"></script>
	</cfif>
</cfif>

<cfif url.module EQ "survey">
	<cfif listfindnocase('showrelatedquestions',url.action) GT 0>
		<script type="text/javascript" src="/js/lib/content/survey/default.js"></script>
	</cfif>
	<cfif listfindnocase('addsurvey,editsurvey',url.action) GT 0>
		<script type="text/javascript">	
			 window.addEvent('domready', function() 
			 { 
			 	myCal = new Calendar({ startdate: { startdate: 'Y/m/d'}, enddate: { enddate: 'Y/m/d'}}, { pad: 0 });
			 })
		</script>
	<cfelseif listfindnocase('addrelatedquestion',url.action) GT 0>
		<script type="text/javascript">
			var xmlHttp
		
			function populateAnswerChoices(questionid,surveyid)
			{ 
			xmlHttp=GetXmlHttpObject();
			if (xmlHttp==null)
			  {
			  alert ("Your browser does not support AJAX!");
			  return;
			  } 
			var url="/cms/content/survey/populateanswerchoices";
			url=url+"?questionid="+questionid+"&surveyid="+surveyid;
			xmlHttp.onreadystatechange=stateChanged;
			xmlHttp.open("GET",url,true);
			xmlHttp.send(null);
			}
			
			function stateChanged() 
			{ 
				if(xmlHttp.readyState==4)
				{
					document.getElementById("dynamic-selects").innerHTML=xmlHttp.responseText;
				}
			}
			
			function GetXmlHttpObject()
			{
			var xmlHttp=null;
			try
			  {
			  // Firefox, Opera 8.0+, Safari
			  xmlHttp=new XMLHttpRequest();
			  }
			catch (e)
			  {
			  // Internet Explorer
			  try
			    {
			    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			    }
			  catch (e)
			    {
			    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			    }
			  }
			return xmlHttp;
			}
		</script>
	</cfif>
</cfif>

<cfif url.module EQ 'products'>
	<cfif listfindnocase('addcoupon,editcoupon',url.action) GT 0>
		<script type="text/javascript" src="/js/lib/commerce/product/coupon.js"></script>
		<script type="text/javascript">	
			 window.addEvent('domready', function() 
			 { 
			 	myCal = new Calendar({ startdate: { startdate: 'm/d/Y'}, enddate: { enddate: 'm/d/Y'}}, { pad: 0 });
			 })
		</script>
	</cfif>
	<cfif url.action EQ 'setprice'>
		<script type="text/javascript" src="/js/lib/commerce/product/showallprices.js"></script>
	</cfif>
	<cfif url.action EQ 'editcart'>
		<script type="text/javascript" src="/js/lib/commerce/product/updatequantity.js"></script>
	</cfif>
	<cfif url.action EQ 'editproduct'>
		<cfoutput>
		<script type="text/javascript">
			window.addEvent('domready', init);
			function init() {
				var viewCategories   = new formSlider('categoriesDL', {duration: 600, titleEl: 'dt', defaultState: 'show'});
			
				var as=new Sortables($('sortableimages'),{
				opacity:.5,
				clone:true,
				handle:'span.handle',
				constrain:true,
				onComplete: function(){
				var savePos = new Request.HTML({method: 'post', url: '/cms/#url.section#/#url.module#/actionsortimages'});
				var so = as.serialize();
				savePos.send('so='+so+'&productid=#request.productid#');
				}
				});
			}
		</script>
		</cfoutput>
	</cfif>
</cfif>

<cfif url.module EQ 'navigation'>
	<cfif listfindnocase('addnavigation,editnavigation',url.action) GT 0>
		<script type="text/javascript" src="/js/nested.js"></script>
		<script type="text/javascript" src="/js/lib/content/navigation/navigationForm.js"></script>
	</cfif>
</cfif>

<cfif url.section EQ 'taskmgmt'>
	<cfif url.module EQ 'troubleticket'>
		<cfif url.action EQ 'showincident'>
			<script type="text/javascript">	
				 window.addEvent('domready', function() 
				 { 
				 	var includeGroups = new formSlider('includeGroups', {duration: 600, titleEl: 'dt', defaultState: 'show'});
				 	<cfloop from="2" to="#comments.recordcount#" index="i">
					 	<cfoutput>
							var hiddencomments#i# = new formSlider('hiddencommentsDL#i#', {useTitleEl: 'no', defaultState: 'hide'});
							hiddencomments#i#.toggleSlide('hiddencommentsDT#i#');
						</cfoutput>
					</cfloop>
				 })
			</script>
		</cfif>
	</cfif>	
</cfif>

<cfif url.section EQ 'media'>
	<cfoutput>
		<cfif listfindnocase('imagemgmt,videomgmt,audiomgmt',url.module) GT 0>
			<cfswitch expression="#url.module#">
				<cfcase value="imagemgmt">
					<cfset item='image'>
				</cfcase>
				<cfcase value="videomgmt">
					<cfset item='video'>
				</cfcase>
				<cfcase value="audiomgmt">
					<cfset item='audio'>
				</cfcase>
			</cfswitch>
			<cfif listfindnocase('showalbums,viewalbum',url.action) GT 0>
				<cfif url.action EQ 'showalbums'>
					<cfset container='imageGalleries'>
				<cfelse>
					<cfset container='imageGallerySorter'>
					<cfif url.module EQ 'imagemgmt'>
						<cfif thereAreItems>
							<script type="text/javascript" src="/js/lib/media/imagemgmt/rotateimage.js"></script>
						</cfif>
						<cfoutput>
						<script type="text/javascript" src="/js/SWFUpload.v2.2.0/swfupload.js"></script>
						<script type="text/javascript" src="/js/SWFUpload.v2.2.0/handlers.js"></script>
						<script type="text/javascript">
							var swfu;
							window.onload = function () {
								swfu = new SWFUpload({
									upload_url: "/media/imagemgmt/actions/uploadimage.cfm",
									post_params : { 
										"c" : '#url.id#',
										"d" : '#client.siteurl#',
										"u" : '#client.masternameid#'
									}, 
									use_query_string: true,
									file_size_limit : "15 MB",
									file_types : "*.jpg;*.gif;*.png;*.jpeg",
									file_types_description : "JPG Images",
									file_upload_limit : "100",
									file_queue_error_handler : fileQueueError,
									file_dialog_complete_handler : fileDialogComplete,
									upload_progress_handler : uploadProgress,
									upload_error_handler : uploadError,
									upload_complete_handler : uploadComplete,
									button_image_url : "/siteimages/icon-states-add-images.png",
									button_placeholder_id : "uploadbutton",
									button_width: 114,
									button_height: 23,
									button_text_top_padding: 0,
									button_text_left_padding: 0,
									button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
									button_cursor: SWFUpload.CURSOR.HAND,
									flash_url : "/js/SWFUpload.v2.2.0/swfupload.swf",
									custom_settings : {
										upload_target : "divFileProgressContainer"
									},
									debug: false
								});
							};
						</script>
						</cfoutput>
					</cfif>
				</cfif>
				<script type="text/javascript">
					window.addEvent('domready',function(){
						<cfif thereAreItems>
						var check_All=function(do_check)
						{
							var checkboxes=$('#container#').getElements('input[id^=chkBox]');
							checkboxes.each(function(el) { 
								el.set('checked',do_check)
								});
						}
						
						var do_check = false;
						
						$('checkAll').addEvent('click', function(e){
							e.stop();
							if(do_check) {
								do_check = false;
								this.getElement('img').setProperty('src','/siteimages/icon-select-all-gallery.png');
								check_All(do_check);
							} else {
								do_check = true;
								this.getElement('img').setProperty('src','/siteimages/icon-deselect-all-gallery.png');
								check_All(do_check);
							}
						});
						
						var getChecked=function()
						{
							var allchecked = new Array();
							var checkboxes=$('#container#').getElements('input[id^=chkBox]');
							var id=0;
							checkboxes.each(function(el)
							{
								if(el.checked==true)
								{
									allchecked[id]=el.getProperty('id').replace('chkBox','');
									id++;
								}
							})
							return(allchecked);
						}
						</cfif>
						<cfif url.action EQ 'showalbums'>
							<cfif thereAreItems>
								$('doDelete').addEvent('click',function(){
									var allchecked=getChecked();
									if(allchecked.length>0){
										if(allchecked.length==1)
										{
											var c=' album?';
										}
										else{
											var c=' albums?';
										}
										var confirmation='If the #item# in the album are not in other albums, the items will be lost. Are you sure you want to delete ' + allchecked.length + c;
										var sure=confirm(confirmation);
										if(sure) 
										{
											var ids=allchecked.toString();
											location.href='/cms/#url.section#/#url.module#/actiondeletealbums/?l=' + ids;
										}					
									}
								});
								
								var as=new Sortables($('#container#'),{
									opacity:.5,
									clone:true,
									handle:'span.handle',
									constrain:true,
									onComplete: function(){
									var savePos = new Request.HTML({method: 'post', url: '/cms/#url.section#/#url.module#/actionsortalbums'});
									var so = as.serialize();
									savePos.send('so='+so);
									}
								});
							</cfif>
						<cfelse>
							<cfif thereAreItems>
								var is=new Sortables($('#container#'),{
									opacity:.5,
									clone:true,
									handle:'span.handle',
									constrain:true,
									onComplete: function(){
									var savePos = new Request.HTML({method: 'post', url: '/cms/#url.section#/#url.module#/actionsort'});
									var so = is.serialize();
									savePos.send('so='+so+'&g=#url.id#');
									}
								});
							</cfif>
							<cfif url.c EQ 0>
								$('albumsQuickJump').addEvent('change', function() {
									var g=$('albumsQuickJump').value;
									location.href='/cms/#url.section#/#url.module#/viewalbum/?id=' + g;
								});
							<cfelse>
								<cfif thereAreItems>
									$('copytoalbums').addEvent('click',function(){
										var checkedimages=getChecked();
										var checkedalbums=getCheckedAlbums();
										if(checkedimages.length>0)
										{
											var ids=checkedimages.toString();
											var req = new Request({
												method: 'post',
												data: {'i' : ids, 'a' : checkedalbums},
												url: '/cms/#url.section#/#url.module#/actioncopytoalbums',
												onComplete: function(response){alert(response)}
											}).send();
										}
									});
									
									var getCheckedAlbums=function()
									{
										var albumarr = new Array();
										var checkboxes=$('albumoptions').getElements('input[id^=album_]');
										var id=0;
										checkboxes.each(function(el)
										{
											if(el.checked==true)
											{
												albumarr[id]=el.getProperty('id').replace('album_','');
												id++;
											}
											
										})
										var albumlist=albumarr.toString();
										return(albumlist);
									}
								</cfif>
							</cfif>
							<cfif thereAreItems>
							var locklinks = $('imageGallerySorter').getElements('span.lock');
							var setstatus = new Request({
								method: 'post', 
								url: '/cms/#url.section#/#url.module#/actionsetstatus',
								onSuccess: function(response){
									lockUnlockImage(response);
								}
							});
							
							locklinks.each(function(el) {
								el.addEvent('click',function() {
									id = this.getProperty('id').replace('lock','');
									setstatus.send("id="+id);
								})
							});
							
							var lockUnlockImage=function(response)
							{
								var params=response.split(',');
								var elementid='lock' + params[0];
								if(params[1].trim()=='1')
								{
									$(params[0]).className='sortCell';
									$(elementid).innerHTML='<img src="/siteimages/icon-gallery-disapprove.gif">';	
								}
								else
								{
									$(params[0]).className='sortCell private';
									$(elementid).innerHTML='<img src="/siteimages/icon-gallery-approve.gif">';
								}
							}
							
							$('doDelete').addEvent('click',function(){
								var allchecked=getChecked();
								if(allchecked.length>0){
									if(allchecked.length==1)
									{
										var c='item';
									}
									else{
										var c='items?';
									}
									var confirmation='The ' + c + ' will be deleted from all albums. Are you sure you want to delete ' + allchecked.length + ' ' + c + '?';
									var sure=confirm(confirmation);
									if(sure) 
									{
										var ids=allchecked.toString();
										location.href='/cms/#url.section#/#url.module#/actiondelete/?g=#url.id#&l=' + ids;
									}					
								}
							});
							
							$('doRemove').addEvent('click',function(){
								var allchecked=getChecked();
								if(allchecked.length>0){
									if(allchecked.length==1)
									{
										var c=' item from this album?';
									}
									else{
										var c=' items from this album?';
									}
									var confirmation='Are you sure you want to remove ' + allchecked.length + c;
									var sure=confirm(confirmation);
									if(sure) 
									{
										var ids=allchecked.toString();
										location.href='/cms/#url.section#/#url.module#/actionremove/?g=#url.id#&l=' + ids;
									}					
								}
							});
							</cfif>
						</cfif>
					})
				</script>
			</cfif>
		</cfif>
	</cfoutput>
</cfif>