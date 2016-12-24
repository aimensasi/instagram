$(document).ready(function(){

	var $userAvatar = $('#user_avatar');
	var $imgFile = $('#img-file');

	$userAvatar.on('change', function(){
		readURL(this);
		$imgFile.submit();
	});

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('.profile-pic').attr('src', e.target.result);
      }

      reader.readAsDataURL(input.files[0]);
    }
  }

});