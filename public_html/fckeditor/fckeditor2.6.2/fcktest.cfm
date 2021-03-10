<script type="text/javascript" src="/js/mootools.v1.11.js"></script>
<script type="text/javascript" src="/js/calendar.js"></script>
<script type="text/javascript" src="/js/fValidator.js"></script>
<script type="text/javascript" src="/js/iMask.js"></script>
<script type="text/javascript" src="/js/mootabs1.2.js"></script>
<script type="text/javascript">
FCKeditorAPI = null;
__FCKeditorNS = null;
window.addEvent('domready', function() {
	$('saveSignupEvent').addEvent('click', function(e) {
		e = new Event(e).stop();
		description.value = FCKeditorAPI.GetInstance('description').GetXHTML();
		$('addEvent').send({ update: $('events-form'), evalScripts: true });
	});  	
});
</script>
<div id="events-form">
<form method="post" action="/fcktest-results.cfm" id="addEvent">
<cfoutput>
					 <cfscript> 
					basePath = "/fckeditor/";
					fckEditor = createObject("component", "#basePath#fckeditor"); 
					fckEditor.instanceName  = "description"; 
					fckEditor.ToolbarSet = "qdelta";
 					fckEditor.width = "480"; 
					fckEditor.height    = "250";
					fckEditor.config.SkinPath = '/fckeditor/editor/skins/ChroomDeluxe/' ;
					fckEditor.config.BrowserContextMenuOnCtrl = true ; 
					fckEditor.config.LinkBrowser = false ; 
					fckEditor.config.LinkUpload = false ; 
					fckEditor.config.ImageBrowser = true ; 
					fckEditor.config.ImageBrowserURL = "/cffm/cffm_image.cfm"; 
					fckEditor.config.ImageUpload = false ; 
					fckEditor.config.FlashBrowser = false ; 
					fckEditor.config.FlashUpload = false ;
					fckEditor.create(); // create the editor. 
					</cfscript></cfoutput>
					<input type="submit" value="Go!" id="saveSignupEvent" />
</form>
</div>
