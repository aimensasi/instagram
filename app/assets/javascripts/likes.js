$(document).ready(function(){
	
	$('.react-plus').on('click', function(){
		var $reactBtn = $(this);
		var $reactBtn = $(this);

		if ($reactBtn.hasClass('l-e-g')) {
			$reactBtn.removeClass('l-e-g').addClass('l-r');
			var action = $reactBtn.attr('data-action');
			
			ajaxRequest(action, 'post');
		}else{
			$reactBtn.removeClass('l-r').addClass('l-e-g');
			var action = $reactBtn.attr('data-action');

			ajaxRequest(action, 'delete');
		}
	});

	$('.post-img').on('dblclick', function(){
		var $postImg = $(this);
		var parent = $postImg.attr('data-parent');
		var $loveBtn = $('.l-' + parent);
		
		$postImg.next('.icon').css('opacity', '1');

		setTimeout(function(){
			$postImg.next('.icon').css('opacity', '0');
		}, 900);
		
		if ($loveBtn.hasClass('l-r')) {
			return;
		}else{
			$loveBtn.trigger('click');
		}
		
	});

	function ajaxRequest(action, type){
		$.ajax({
			url: action,
			type: type,
			dataType: 'script'
		});
	}


});