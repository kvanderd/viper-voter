$(document).on 'ready page:load', ->

	$(document).on 'ready page:load', ->
	$("#change_name").keyup ->
			$("#name").text($(this).val());
		$("#change_description").keyup ->
			$("#description").text($(this).val());

		# $('input[type=checkbox]').change ->
	 #        if (this.checked)
	 #        	$("#category").text($(this).val())



  readURL = (input) ->
    if input.files and input.files[0]
      reader = new FileReader()
      reader.onload = (e) ->
        $("#blah").attr "src", e.target.result
      reader.readAsDataURL input.files[0]

  $("#change_picture").change ->
    readURL this

	
	

	$("[type=checkbox]").on "change", ->
		s = ""
		$("[type=checkbox]:checked").each ->
			s += @value + " <div class='glyphicon glyphicon-star-empty'></div> "
			$("#category").html s.slice(0, s.length - 1)