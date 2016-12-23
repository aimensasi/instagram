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
				console.log('True' + validateInputs());
				sendAjax($form.attr('action'), $form.serialize());	
			}else{
				console.log('False' + validateInputs());
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
		console.log(data);
		if (data.status != 200) {
			if (data.type == 'edit-user') {
				$('#edit-message').addClass('error').text(data.messages);
			}else if (data.type == 'change-password') {
				$('#password-message').addClass('error').text(data.messages);
			}
		}else{

			if (data.type == 'edit-user') {
				console.log(data.type);
				$('#edit-message').text(data.messages);
			}else if (data.type == 'change-password') {
				console.log(data.type);
				$('#password-message').addClass('success').text(data.messages);
			}
		}
	}

});