<cfoutput>
	<link rel="stylesheet" href="/css/styles.css" media="screen" />
	<link rel="stylesheet" href="/css/tooltip.css" media="screen" />
	<cfif listfindnocase("profile,addaudio,editaudio,addfile,addvideoalbum,editvideoalbum,addvideo,editvideo,editimage,addalbum,editalbum,uploadcontacts,addsubscriptionplan,editsubscriptionplan,addtermmeasure,edittermmeasure,additemtoproductgroup,addproductgroup,editproductgroup,addemailserver,editemailserver,setprice,addcoupon,editcoupon,addcategory,editcategory,addprice,editprice,addproduct,editproduct,addnavigation,editnavigation,addrelatedquestion,editrelatedquestion,addanswerchoice,editanswerchoice,addquestion,editquestion,addsurvey,editsurvey,editreview,notes,addeventcategory,editeventcategory,addevent,editevent,addpatch,editpatch,addwebpage,editwebpage,editwptemplate,addwptemplate,edithauoption,addhauoption,addadvertisement,editadvertisement,advancedsearch,findduplicates,uploadcontact,exportcontacts,addcontact,editcontact,addgroup,editgroup,reportincident,showincident,addnewsletter,editnewsletter,addnewslettertemplate,editnewslettertemplate,addfile,editfile,addlink,editlink,addcontest,editcontest,addforum,editforum,addBlogEntry,editBlogEntry,addBlog,editBlog,addBlogCategory,editBlogCategory,adduser,edituser,addnewsite,editsite,webpages,addmodule,editmodule,addsection,editsection,addrole,editrole",url.action) GT 0>
		<link rel="stylesheet" href="/css/forms.css" media="screen" />
	</cfif>
	<cfif url.module EQ 'imagemgmt'>
		<cfif url.action EQ 'viewalbum'>
			<link rel="stylesheet" media="screen" href="/css/uploader.css" />
		</cfif>
	</cfif>
	<cfif listfindnocase("addcoupon,editcoupon,addsurvey,editsurvey,addevent,editevent,addadvertisement,editadvertisement,advancedsearch,addnewsletter,editnewsletter,addcontest,editcontest,addBlogEntry,editBlogEntry,viewBlogEntries",url.action) GT 0>
		<link rel="stylesheet" href="/css/calendar.css" />
	</cfif>
	<cfif listfindnocase("showevents",url.action) GT 0>
		<link rel="stylesheet" href="/css/mooECal.css" />
		<link rel="stylesheet" href="/js/thickbox.css" />
	</cfif>
</cfoutput>