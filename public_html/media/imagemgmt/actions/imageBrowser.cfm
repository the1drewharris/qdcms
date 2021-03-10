<!--- <cfoutput><h2>#application.thissite# - #cgi.HTTP_REFERER#</h2></cfoutput> --->

<!--- <cfif listfindnocase(application.fckimagebrowser,CGI.HTTP_REFERER) EQ 0>
	<cfif findnocase('http://#application.thissite#/media/imagemgmt/actions/imageBrowser.cfm',CGI.HTTP_REFERER) EQ 0>
		<cflocation url="/cms/accessdenied" addtoken="false">
	</cfif>
</cfif> --->
<cfparam name="url.category" default="">
<cfparam name="url.shared" default="0">
<cfif client.parentsiteid neq 0>
	<cfset url.shared = 1>
</cfif>
<html>
<head>
<link rel="stylesheet" href="/css/forms.css" type="text/css" media="screen" />
<link rel="stylesheet" href="/css/calendar.css" media="screen" />
<link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" />
<script type="text/javascript" src="/js/mootools.v1.2.js"></script>
<script type="text/javascript" src="/js/fValidator.js"></script>
<script type="text/javascript" src="/js/calendar.js"></script>
<title>QDcms.com | Image Browser</title>
<cfif NOT len(url.category)>
<script type="text/javascript">				
	window.addEvent('domready', function(){
	
		imageGalleriesUL = $('imageBrowserGalleries');
		var loadingHTML = '<img src="/siteimages/loading.gif" />';
	
		// Begin AJAX Requests

		imageGalleriesUL.set('html','<center>' + loadingHTML + '</center>');
		var imageListArray = new Array();

	
		var jsonRequest = new Request.JSON({url: '<cfoutput>/media/imagemgmt/actions/searchAlbums.cfm?alsoshared=#url.shared#</cfoutput>', onComplete: function(jsonObj){
				createImageGalleryItems(jsonObj);
			}}).send(); 
			
	
		// End AJAX Requests	
			
		var createImageGalleryItems = function(jsonObj) 
		{
			var searchResults = jsonObj.DATA;
			imageGalleriesUL.erase('html');
			for(var i = 0; i < searchResults.IMAGECATEGORYID.length; i++) 
			{
				var imageCategory = searchResults.IMAGECATEGORY[i];
				if(searchResults.SHARED[i]==1) imageCategory = 'Shared ' + imageCategory; //binod@quantumdelta.com on 20091210 
				if(imageCategory.length>=25) imageCategory = imageCategory.substring(0,23)+'...';
				var albumID = searchResults.IMAGECATEGORYID[i];
				var el = new Element('li', {'class': 'sortCell', 'id': albumID});
				var titleBar = new Element('div', {'class': 'titleBar'}).inject(el);
				var titleLink = new Element('a', {'href': '?category='+albumID + '&shared=' +searchResults.SHARED[i]}).inject(titleBar);
				var spanTitle = new Element('span', {'id': 'imagetitle' + albumID,'html': imageCategory}).inject(titleLink);
				var clear = new Element('div', {'class': 'clear'}).inject(titleBar);
				var center = new Element('center').inject(el);
				var imageLink = new Element('a', {'href': '?category='+albumID +'&shared=' +searchResults.SHARED[i], 'class': 'handle'}).inject(center);
				var divImageBlock = new Element('div', {'class': 'imageBlock', 'id': 'imageBlock' + albumID}).inject(imageLink);
				var image = new Element('img', {'src': searchResults.SITE[i] + '/images/qdcms/' + searchResults.IMAGEPATH[i]}).inject(divImageBlock);
				var quickInfo = new Element('span', {'class':'quickGalleryInfo', 'html': 'Images: '+searchResults.IMAGECOUNT[i]+''}).inject(center);
				el.inject(imageGalleriesUL);
			}
			
			var divClear = new Element('div', {'class': 'clear'}).inject(imageGalleriesUL);
		}
			
	// Search
	
	$('doSearch').addEvent('click', function(e) {
		e.stop();
		imageGalleriesUL.set('html','<center>' + loadingHTML + '</center>');
		var searchRequest = new Request.JSON({url: '/media/imagemgmt/actions/searchAlbums.cfm?s=' + $('searchBox').value, onComplete: function(jsonObj){
			createImageGalleryItems(jsonObj);
		}}).send();
	});
	
	$('showAll').addEvent('click', function(e) {
		e.stop();
		$('searchBox').set('value','');
		imageGalleriesUL.set('html','<center>' + loadingHTML + '</center>');
		jsonRequest.send();
	});
	
	// End Search
	
	});
</script>
</head>
<body id="imageBrowser">
	<div style="float: left">
		<cfoutput>
			<h1>Choose An Album</h1>
			<!---<cfdump var="#CGI.HTTP_REFERER#">--->
		</cfoutput>
	</div>
	<div style="float: right;">
		<form>
			<input type="text" name="searchBox" id="searchBox" />
			<input type="submit" id="doSearch" value="Search" />
			<a href="" id="showAll">Show All</a>
		</form>
	</div>
	<div class="clear"> </div>
	<div id="result"> </div>
	<div id="imageGalleryContainer">
		<ul id="imageBrowserGalleries">
		
		</ul>
	</div>
<cfelse>
</head>
<body id="imageBrowser">

<script type="text/javascript">				
	window.addEvent('domready', function(){
		
	// Set Variables Here
	
		// Get the Category from the URL query String
			var categoryID = gup('category');
			var sharedOrNot = gup('shared');
		
			var loadingHTML = '<img src="/siteimages/loading.gif" />';
			imageGallerySorter.set('html','<center>' + loadingHTML + '</center>');
		
	
	
	// Begin AJAX Requests
		var jsonRequest = new Request.JSON({url: '/media/imagemgmt/actions/searchImages.cfm?gid=' + categoryID + '&shared=' + sharedOrNot, onComplete: function(jsonObj){
				createImageItems(jsonObj);
			}}).send();
	
	// End AJAX Requests	
	
		var createImageItems = function(jsonObj) {
				var searchResults = jsonObj.DATA;
				imageGallerySorter.erase('html');
			for(var i = 0; i < searchResults.TITLE.length; i++) {
				var imageTitle = searchResults.TITLE[i];
				if(imageTitle.length<=0) imageTitle = searchResults.IMAGEPATH[i];
				if(imageTitle.length>=15) imageTitle = imageTitle.substring(0,12)+'...';
				var imageID = searchResults.IMAGEID[i];
				var el = new Element('li', {'class': 'sortCell', 'id': imageID});
				var titleBar = new Element('div', {'class': 'titleBar'}).inject(el);
				var spanTitle = new Element('span', {'id': 'imagetitle' + imageID,'html': imageTitle}).inject(titleBar);
				var clear = new Element('div', {'class': 'clear'}).inject(titleBar);
				var center = new Element('center').inject(el);
				var spanHandle = new Element('span', {'class': 'handle'}).inject(center);
				var divImageBlock = new Element('div', {'class': 'imageBlock', 'id': 'imageBlock' + imageID}).inject(spanHandle);
				
				//add the correct dev path here
				var image = new Element('img', {'src': searchResults.SITE[i] + '/images/qdcms/' + searchResults.IMAGEPATH[i]}).inject(divImageBlock);
				var insertSmImgLink = new Element('a', {'class': 'insertLink', 'html': 'Sm', 'href': searchResults.SITE[i] + '/images/tiny/' + searchResults.IMAGEPATH[i]}).inject(center);
				center.appendText(' ');
				var insertMedImgLink = new Element('a', {'class': 'insertLink', 'html': 'Med', 'href': searchResults.SITE[i] + '/images/small/' + searchResults.IMAGEPATH[i]}).inject(center);
				center.appendText(' ');
				var insertLargeImgLink = new Element('a', {'class': 'insertLink', 'html': 'L', 'href': searchResults.SITE[i] + '/images/large/' + searchResults.IMAGEPATH[i]}).inject(center);
				center.appendText(' ');
				var insertXLargeImgLink = new Element('a', {'class': 'insertLink', 'html': 'XL', 'href': searchResults.SITE[i] + '/images/detail/' + searchResults.IMAGEPATH[i]}).inject(center);
				center.appendText(' ');
				var insertOriginalImgLink = new Element('a', {'class': 'insertLink', 'html': 'Org', 'href': searchResults.SITE[i] + '/images/' + searchResults.IMAGEPATH[i]}).inject(center);
				el.inject(imageGallerySorter);
			}
			var divClear = new Element('div', {'class': 'clear'}).inject(imageGallerySorter);
			findImages();
		}
		
	$('doSearch').addEvent('click', function(e) {
		e.stop();
		imageGallerySorter.set('html','<center>' + loadingHTML + '</center>');
		var searchRequest = new Request.JSON({url: '/media/imagemgmt/actions/searchImages.cfm?gid=' + categoryID + '&s=' + $('searchBox').value, onComplete: function(jsonObj){
			createImageItems(jsonObj);
		}}).send();
	});
	
	findImages = function() {
	
	imageGallerySorter.getElements('a.insertLink').each(function(el) {
		el.addEvent('click', function(e) {
			e.stop();
			// window.opener.SetUrl( url, width, height, alt);
			window.opener.SetUrl(el.getProperty('href'));
			window.close();
		});
	});
	}
	
	$('showAll').addEvent('click', function(e) {
		e.stop();
		$('searchBox').set('value','');
		imageGallerySorter.set('html','<center>' + loadingHTML + '</center>');
		jsonRequest.send();
	});
		
	// Album Quick Jump
	$('albumsQuickJump').addEvent('change', function() {
		window.location = "/media/imagemgmt/actions/imageBrowser.cfm?category=" + this.value + "&shared=0";
	});
	
	// Function for parsing URL query string
		function gup( name ) {
			name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
			var regexS = "[\\?&]"+name+"=([^&#]*)";
			var regex = new RegExp( regexS );
			var results = regex.exec( window.location.href );
			if( results == null )
				return "";
			else
				return results[1];
			}
	});
</script>
	<cfif url.shared EQ 0>
		<cfinvoke component="imageGallery" method="getGalleryInfo" imagedsn="#client.siteurl#" galleryid="#url.category#" returnVariable="getGalleryInfo" />
	<cfelse>
		<cfinvoke component="site" method="getSiteInfo" siteid="#client.parentsiteid#" returnvariable="parentsiteinfo">
		<cfinvoke component="imageGallery" method="getGalleryInfo" imagedsn="#parentsiteinfo.siteurl#" galleryid="#url.category#" returnVariable="getGalleryInfo" />
	</cfif>
	<cfinvoke component="imageGallery" method="getGalleries" imagedsn="#client.siteurl#" returnVariable="getAlbums" />
	<div style="float: left">
	<cfoutput>
		<h1>Album: #getGalleryInfo.imagecategory# </h1>
		<!---<cfdump var="#CGI.HTTP_REFERER#">--->
	</cfoutput>
	</div>
	<div style="float: right;">
	<form>
		<input type="text" name="searchBox" id="searchBox" />
		<input type="submit" id="doSearch" value="Search" />
		<a href="" id="showAll">Show All</a>
	</form>
	</div>
	<div class="clear"> </div>
<div id="result"> </div>
<div id="imageGalleryContainer">
	<div class="titleBar">
		<div style="float: right;">
			<select name="albums" id="albumsQuickJump" style="width: 250px;">
			<cfoutput query="getAlbums">
				<option value="#imagecategoryid#"<cfif url.category EQ imagecategoryid> selected</cfif>>#imagecategory#</option>
			</cfoutput>
			</select>
		</div>
		<div class="clear"></div>
	</div>
	<ul id="imageGallerySorter">
	
	</ul>
</div>
</p>
</cfif>
</body>
</html>