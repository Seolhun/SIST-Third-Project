var form = $('#contact'), submit = form.find('[name="submit"]');

form.on('submit', function(e) {
	e.preventDefault();
	// avoid spamming buttons
	if (submit.attr('value') !== 'Send')
		return;
	var valid = true;
	form.find('input, textarea').removeClass('invalid').each(function() {
		if (!this.value) {
			$(this).addClass('invalid');
			valid = false;
		}
	});

	if (!valid) {
		form.animate({
			left : '-3em'
		}, 50).animate({
			left : '3em'
		}, 100).animate({
			left : '0'
		}, 50);
	} else {
		submit.attr('value', 'Sending...').css({
			boxShadow : '0 0 200em 200em rgba(225, 225, 225, 0.6)',
			backgroundColor : '#ccc'
		});
		// simulate AJAX response
		setTimeout(function() {
			// step 1: slide labels and inputs
			// when AJAX responds with success
			// no animation for AJAX failure yet
			form.find('label').animate({
				left : '100%'
			}, 500).animate({
				opacity : '0'
			}, 500);
		}, 1000);
		setTimeout(function() {
			// step 2: show thank you message after step 1
			submit.attr('value', 'Thank you :)').css({
				boxShadow : 'none'
			});
		}, 2000);
		setTimeout(function() {
			// step 3: reset
			form.find('input, textarea').val('');
			form.find('label').css({
				left : '0'
			}).animate({
				opacity : '1'
			}, 500);
			submit.attr('value', 'Send').css({
				backgroundColor : ''
			});
		}, 4000);
	}
});

$(function() {
	$('#sendBtn').click(function() {
		var kind = $('#kind').val();
		if (kind.trim() == "") {
			$('#kind').focus();
			$('#kind').val("");
			return;
		}
		var subject = $('#subject').val();
		if (subject.trim() == "") {
			$('#subject').focus();
			$('#subject').val("");
			return;
		}
		var content = $('#content').val();
		if (content.trim() == "") {
			$('#content').focus();
			$('#content').val("");
			return;
		}
		$('#sendBtn').submit();
	});
});

