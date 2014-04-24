$ ->
	$("#change_name").keyup ->
		$("#name").text($(this).val());
	$("#change_description").keyup ->
		$("#description").text($(this).val());
		# kiss = $("#opinion_name").val()
		# $("#name").prepend(kiss)