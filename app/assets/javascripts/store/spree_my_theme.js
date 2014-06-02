//= require jquery
//= require jquery_ujs
//= require store/spree_core

$(function(){
	$('#sort_panel').change(function(val) {
		console.log(window.location.pathname);
		$.ajax({
			url: window.location.pathname,
			data: 'sort=sku'
		});
	});	
});