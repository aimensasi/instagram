$(document).ready(function(){
	var $postForm = $('#new-post');
	var $mediaFile = $('#post_media');
	var $formBody = $('.form-body');
	var $fileRow = $('.btn-file');
	var $formFooter = $('.form-footer');
	var $postImg = $('.post-media');
	var $postsList = $('#posts-list');

	$postForm.on('submit', function(e){
		// e.preventDefault();
		$postImg.css('display', 'none');
		$formFooter.css('display', 'none');
	});

	$mediaFile.on('change', function(){
		console.log('change');
		changeImage(this);
	});

	function changeImage(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();

	    reader.onload = function (e) {
	      $postImg.attr('src', e.target.result).css('display', 'initial');
	      $formFooter.show();
	    }
	    reader.readAsDataURL(input.files[0]);
	  }
	}

});