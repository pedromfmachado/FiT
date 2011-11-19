// All related to form validation here

$(document).ready(function() {
  $(".alert-message").alert();

  validateForm("#edit_user_1");
  validateForm("#new_user");
});

function validateForm(selector) {
  $(selector).validate( {
    // rules for each field
    rules: {
      name: {
        required: true,
        minLength: 2
      },
      date: {
        required: true,
        date: true
      },
      email: {
        required: true,
        email: true
      },
      phone: "required",
      address: "required"
    },

    // messages for each field
    messages: {
      name: "Escreva o seu nome (no mínimo 2 caracteres)",
      date: "Introduza uma data válida",
      email: "Introduza um email válido (ex: exemplo@sapo.pt)",
      phone: "Introduza o seu contacto",
      address: "Introduza uma morada válida"
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
}

