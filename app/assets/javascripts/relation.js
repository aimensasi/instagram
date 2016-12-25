$(document).ready(function(){

	$(document).on('click', '.btn-follow, .btn-unfollow', function(e){
		e.stopPropagation();
		var $btn = $(this);
		var url = '/users/'+ $btn.attr('data-parent') +'/relations';
		var type = $btn.attr('data-method');

		$btn.addClass('hide');
		if (type == 'post') {
			var $unFollowBtn = $btn.parent().find('.btn-unfollow');
			$unFollowBtn.removeClass('hide');

		}else if (type == 'delete') {
			url += '/0';
			var $followBtn = $btn.parent().find('.btn-follow');
			$followBtn.removeClass('hide');
		}

		ajaxRequest(url, type);
	});

	function ajaxRequest(url, type){
		$.ajax({
			url: url,
			type: type,
			dataType: 'json',
			cache: false,
			success: function(data){
				// console.log(data);
			},
			error: function(err){
				// console.log(err);
			}
		});
	}

});