window.addEvent('domready', function() {				
	var handle = 'handle';	
	
	if($('pendingEvents'))
		var pendingEventsSC = new simpleCollapserDL({ dl: $('pendingEvents').getElement('dl'), duration: 300, handle: 'handle'});
		
	if($('pendingComments'))
		var pendingCommentsSC = new simpleCollapserDL({ dl: $('pendingComments').getElement('dl'), duration: 300, handle: 'handle'});	
		
	$$('.checkAll').each(function(el) {
		el.addEvent('click', function() {
			el.getParent('div').getElements('input[class!=checkAll]').each(function(item) {
				item.checked = el.checked;
			});
		});
	});
	
	
	var getCheckboxes = function(elem,prefix,url,mode) {
		if(!prefix) prefix = "";
		var waiter = new Waiter(elem, {layer: { styles: {opacity: 0.85, background: '#fff' }}});
		var items = new Hash();
		elem.getElements('input[class!=checkAll]').each(function(input) {
			if(input.checked)
				items.set(prefix + input.get('name'),'on');							
		})
		if(items.getLength() > 0) {
			var processPending = new Request({
				url: url, 
				data: items, 
				onRequest: function() { waiter.start() },
				onFailure: function() { waiter.stop(); alert("Oops, an error has occurred"); },
				onSuccess: function() {
					waiter.stop();
					(function() { 
						inputCount = elem.getElements('input[class!=checkAll]').length;
						if(items.getLength() == inputCount) {

							$(elem).nix({duration: 600}, true);
							
						} else {
						
							elem.getElements('input[class!=checkAll]').each(function(input) {
								if(input.checked) 
									input.getParent('dt.' + input.get('name')).nix({duration: 600, mode: mode}, true);

							});
						
						}
					}).delay(200); // added this delay to give the waiter enough time to disappear
					
					(function() {
						if($('pending').getElements('input[class!=checkAll]').length <= 0) {
							$('pending').nix(true);
						}
					}).delay(900);
					
			}}).send();
		} else {
			alert("No items were checked");
		}
	
	}
	
	$$('.approveComments').addEvent('click', function(e) {
		e.stop();
		getCheckboxes($('pendingComments'),"approve_","/content/blog/actions/processpendingComments.cfm?ajax=yes","vertical");
	});
	
	$$('.disapproveComments').addEvent('click', function(e) {
		e.stop();
		getCheckboxes($('pendingComments'),"delete_","/content/blog/actions/processpendingComments.cfm?ajax=yes","vertical");
	});
	
	$$('.approveEvents').addEvent('click', function(e) {
		e.stop();
		getCheckboxes($('pendingEvents'),"approve_","/events/actions/processpending.cfm?ajax=yes","vertical");
	});
	
	$$('.disapproveEvents').addEvent('click', function(e) {
		e.stop();
		getCheckboxes($('pendingEvents'),"delete_","/events/actions/processpending.cfm?ajax=yes","vertical");
	});
	
	$$('.approveImages').addEvent('click', function(e) {
		e.stop();
		getCheckboxes($('pendingImages'),"approve_","/media/imagemgmt/actions/processpending.cfm?ajax=yes","horizontal");
	});

	$$('.disapproveImages').addEvent('click', function(e) {
		e.stop();
		getCheckboxes($('pendingImages'),"delete_","/media/imagemgmt/actions/processpending.cfm?ajax=yes","horizontal");
	});
});