$(document).ready(function(){

	$(document).on('input', '#password, #confirm-password, #old-password', function(){
		$('.btn-save').prop('disabled', false);	
	});

	$('.form').on('submit', function(e){
		e.preventDefault();
		var $form = $(this);

		if ($form.attr('data-name') == 'edit-user') {
			sendAjax($form.attr('action'), $form.serialize());
		}else if ($form.attr('data-name') == 'change-password') {
			if (validateInputs()){
				sendAjax($form.attr('action'), $form.serialize());	
			}else{
				return;
			}
		}

	});

	function validateInputs(){
		var $passwordConfirm = $('#confirm-password');
		var $password = $('#password');
		var $oldPassword = $('#old-password');

		if ($oldPassword.val() == "" || $password.val() == "" || $passwordConfirm.val() == "") {
			$password.addClass('in_err').attr('placeholder', "Old Password Is Required");
			$oldPassword.addClass('in_err').attr('placeholder', "Old Password Is Required");
			$passwordConfirm.addClass('in_err').attr('placeholder', "Old Password Is Required");

			return false;

		}else if ($password.val() != $passwordConfirm.val()) {
			$password.val('').addClass('in_err').attr('placeholder', "Password Don't Match");
			$passwordConfirm.val('').addClass('in_err').attr('placeholder', "Password Don't Match");
		
			return false;

		}else{

			return true;
		}
	}

	function sendAjax(url, data){
		$.ajax({
			url: url,
			type: 'post',
			dataType: 'json',
			data: data,
			cache: false,
			success: handleResponse,
			error: function(err){
				console.log(err);
			}
		});
	}

	function handleResponse(data){
		var $editMessage = $('#edit-message');
		var $passwordMessage = $('#password-message');

		if (data.type == 'edit-user') {

			if (data.status == 200) {
				displayNotice($editMessage, 'success');
				$editMessage.text(data.message);
			}else{
				displayNotice($editMessage, 'error');
				$editMessage.text(data.message);
			}

		}else if (data.type == 'change-password') {

			if (data.status == 200) {
				displayNotice($passwordMessage, 'success');
				$passwordMessage.text(data.message);
			}else{
				displayNotice($passwordMessage, 'error');
				$passwordMessage.text(data.message);
			}

		}

		// Enable Save Button and hide message after 3sec
		$('.btn-save').prop('disabled', false);
		setTimeout(function(){
			$('.message').text('');
		}, 3000);

	}//handel ajax response

	function displayNotice($e, type){
		if (type == 'success') {
			$e.removeClass('error').addClass('success');
		}else{
			$e.removeClass('success').addClass('error');
		}
	}

});