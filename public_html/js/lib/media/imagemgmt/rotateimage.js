window.addEvent('domready',function(){
	var rotateright=$('imageGallerySorter').getElements('span.rotateRight');
	var rotateleft=$('imageGallerySorter').getElements('span.rotateLeft');
	var rotateRequest = new Request({
		method: 'post',
		url: '/cms/media/imagemgmt/actionrotateimage',
		onSuccess: function(response){
			loadRotatedImage(response);
		}
	});
	
	rotateright.each(function(el){
		el.addEvent('click',function(){
			id=this.getProperty('id').replace('rotateRight','');
			imgblockid='imageBlock' + id;
			$(imgblockid).innerHTML='<img src="/siteimages/loading.gif">';
			rotateRequest.send('imageid='+id+'&a=90');
		})
	});
	
	rotateleft.each(function(el){
		el.addEvent('click',function(){
			id=this.getProperty('id').replace('rotateLeft','');
			imgblockid='imageBlock' + id;
			$(imgblockid).innerHTML='<img src="/siteimages/loading.gif">';
			rotateRequest.send('imageid='+id+'&a=270');
		})
	});
	
	//response=id of the imaage, name of the image,
	var loadRotatedImage=function(response)
	{
		var params=response.split(',');
		var elementid='imageBlock' + params[0];
		var imagehtml='<img src="' + params[1] + '">';
		$(elementid).innerHTML=imagehtml;	
	}
})