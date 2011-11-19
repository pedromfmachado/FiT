// All related to form validation here

$(document).ready(function() {
  $(".alert-message").alert();

  $("#edit_user_1").validate( {
    // rules for each field
    rules: {
      name: "required",
      date: {
        required: true,
        date: true
      },
      email: {
        required: true,
        email: true
      }
    },

    // messages for each field
    messages: {
      name: "Por favor escreva o seu nome",
      email: "Por favor introduza um email válido (ex: exemplo@sapo.pt)"
    },

    // add/remove bootstrap error classes
    highlight: function (element, errorClass, validClass) {
      $(element).parents("div[class='clearfix']").addClass("error");
    },
    unhighlight: function (element, errorClass, validClass) {
      $(element).parents(".error").removeClass("error");
    },
    errorElement: 'p'
  });

});

