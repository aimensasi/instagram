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

	function ajaxRequest(action, type){
		$.ajax({
			url: action,
			type: type,
			dataType: 'script'
		});
	}


});