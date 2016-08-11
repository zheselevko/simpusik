$(document).ready(function() {
						   
	var hash = getHash();
	
	if (hash.hasOwnProperty('tab') && $('#tab-' + hash.tab).length) {
		$("a[href='#tab-" + hash.tab + "']").trigger('click');
	}
	
	$('.slider').change(function(event){
		$(this).closest('.form-group.parent').next('.children').slideToggle('fast');
	});
	
	$('#form').delegate('p.link a.js', 'click', function(event){
		event.preventDefault();
		$(this).parent().next('.content').slideToggle('fast');
	});

});

function getHash() {
	
	var hash = window.location.hash;
	var data = {};
	
	if (hash) {
		
		hash =  hash.substring(1); // remove #
		var hashVars = hash.split('&');
		
		for (var i = 0; i <= (hashVars.length); i++) {
			
			if (hashVars[i]) {
				
				var hashVarsPair = hashVars[i].split('=');
				
				if (hashVarsPair[0]) {
					data[hashVarsPair[0]] = hashVarsPair[1];
				}
			}
		}
		
		
	}
	
	return data;
}