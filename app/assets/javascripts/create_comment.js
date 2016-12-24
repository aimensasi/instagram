$(document).ready(function(){

	$('.new-comment').on('submit', function(e){
		e.preventDefault();

		$.ajax({
			url: $(this).attr('action'),
			type: 'post',
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
		$(this).find('.comment').val("");
		
	});
});