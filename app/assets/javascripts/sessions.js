$(document).ready(function(){
	$('.form-wrapper .link-to').on('click', function(e){
		e.preventDefault();
		$('.message').text("");
		if ($(this).attr("data-parent") == "sign-up") {
			displayForms();
		}else if ($(this).attr("data-parent") == "sign-in") {
			displayForms();
		}

	});

	function displayForms(){
		var $signUpForm = $('.signup-wrapper');
		var $signInForm = $('.login-wrapper');

		if ($signUpForm.hasClass('active')) {
			$signUpForm.removeClass('active');
			$signInForm.addClass('active');	
		}else{
			$signUpForm.addClass('active');
			$signInForm.removeClass('active');
		}
	}

	$('.form').on('submit', function(e){
		e.preventDefault();
		var $form = $(this);

		if ($form.attr('data-name') == 'sign-up') {
			sendAjax('/users', $form.serialize());
		}else if ($form.attr('data-name') == 'log-in') {
			sendAjax('/sessions', $form.serialize());
		}else if ($form.attr('data-name') == 'edit-user') {
			sendAjax($form.attr('action'), $form.serialize());
		}else if ($form.attr('data-name') == 'change-password') {
			sendAjax($form.attr('action'), $form.serialize());
		}
	});


	function sendAjax(url, data){
		$.ajax({
			url: url,
			type: 'post',
			dataType: 'json',
			data: data,
			cache: false,
			success: function(data){
				// if (data.status == 200) {
				// 	window.location = data.url
				// }else if (data.status == 400) {
				// 	$('.message').text(data.message);
				// 	$('.btn-fb').prop('disabled', false);
				// }
				console.log(data);
			},
			error: function(err){
				console.log(err);
			}
		});
	}

});















