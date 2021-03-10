window.addEvent('domready',function(){
	var locklinks = $('imageGallerySorter').getElements('span.lock');
	var changeimagestatus = new Request({
		method: 'post', 
		url: '/cms/media/imagemgmt/actionsetstatus',
		onSuccess: function(response){
			lockUnlockImage(response);
		}
	});
	
	locklinks.each(function(el) {
		el.addEvent('click',function() {
			id = this.getProperty('id').replace('lock','');
			changeimagestatus.send("imageid="+id);
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
		else if(params[1].trim()=='0')
		{
			$(params[0]).className='sortCell private';
			$(elementid).innerHTML='<img src="/siteimages/icon-gallery-approve.gif">';
		}
	}
})