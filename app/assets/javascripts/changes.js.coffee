$ ->
	$("#change_name").keyup ->
		$("#name").text($(this).val());
	$("#change_description").keyup ->
		$("#description").text($(this).val());
		# kiss = $("#change_name").val()
		# $("#name").prepend(kiss)