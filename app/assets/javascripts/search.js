$(document).ready(function(){
	var $searchQuery = $('.search-query');

	$searchQuery.on('input', function(){
		// console.log($(this).serialize());
		if ($(this).val() == "") {
			console.log('Empty');
			$('#search-result').addClass('hide-result');
			return;
		}

		$.ajax({
			url: '/search',
			type: 'get',
			dataType: 'script',
			data: $(this).serialize(),
			cache: false,
			success: function(data){
				// console.log(data);
			},
			error: function(err){
				console.log(err);
			}
		});

	});
});