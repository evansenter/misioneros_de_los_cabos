$(function() {
  $("form :input.required").change(function(element) {
    var filled_out = _.all($("form .required"), function(el) { return $(el).val() != "" });
  
    if (filled_out) {
      $("#upload_form_button").removeAttr("disabled");
    }
  })
});
