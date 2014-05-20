// Generated by CoffeeScript 1.6.3
$(document).on('ready page:load', function() {
  var readURL;
  $(document).on('ready page:load', function() {});
  $("#change_name").keyup(function() {
    return $("#name").text($(this).val());
  });
  $("#change_description").keyup(function() {
    return $("#description").text($(this).val());
  });
  readURL = function(input) {
    var reader;
    if (input.files && input.files[0]) {
      reader = new FileReader();
      reader.onload = function(e) {
        return $("#blah").attr("src", e.target.result);
      };
      return reader.readAsDataURL(input.files[0]);
    }
  };
  $("#change_picture").change(function() {
    return readURL(this);
  });
  return $("[type=checkbox]").on("change", function() {
    var s;
    s = "";
    return $("[type=checkbox]:checked").each(function() {
      s += this.value + " <div class='glyphicon glyphicon-star-empty'></div> ";
      return $("#category").html(s.slice(0, s.length - 1));
    });
  });
});
