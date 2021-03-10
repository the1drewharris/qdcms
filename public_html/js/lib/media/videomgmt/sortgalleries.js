window.addEvent('domready',function(){
	var as=new Sortables($('imageGalleries'),{
		opacity:.5,
		clone:true,
		handle:'span.handle',
		constrain:true,
		onComplete: function(){
		var savePos = new Request.HTML({method: 'post', url: '/cms/media/videomgmt/actionsortvideoalbums'});
		var so = as.serialize();
		savePos.send('so='+so);
		}
	});
})