// All related to form validation here

$(document).ready(function() {
  $(".topbar").dropdown();

  $(".alert-message").alert();

  jQuery.validator.addMethod("exactLength", function(value, element, param) {
    return this.optional(element) || value.length == param;
  }, jQuery.format("Please enter exactly {0} characters."));
  
  jQuery.validator.addMethod("passwordValidation", function(value, element, param) {
    if (this.optional(element))
	  return true;

    var re = /^\w*(?=\w*\d)(?=\w*[a-z])(?=\w*[A-Z])\w*$/;
    return re.test(value) == param;
  }, "Your password must include uppercase, lowercase and digit characters");

  validateForm("#edit_user");
  validateForm("#new_user");
});

function validateForm(selector) {
  $(selector).validate( {
    // rules for each field
    rules: {
      "user[nome]": {
        required: true,
        minlength: 2
      },
      "user[datanascimento]": {
        required: true,
        dateISO: true
      },
      "user[email]": {
        required: true,
        email: true
      },
      "user[telefone]": {
        required: true,
        digits: true,
        exactLength: 9
      },
      "user[morada]": {
        required: true,
      },
      "user[password]": {
         required: true,
         //passwordValidation: true,
         rangelength: [8,16]
      },
      "user[password_confirmation]": {
        required: true,
        equalTo: "#user_password"
      }
    },

    // messages for each field
    messages: {
      "user[nome]": "Escreva o seu nome (no mínimo 2 caracteres)",
      "user[datanascimento]": "Introduza uma data válida",
      "user[email]": "Introduza um email válido (ex: exemplo@sapo.pt)",
      "user[telefone]": "Introduza o seu contacto",
      "user[morada]": "Introduza uma morada válida",
      "user[password]": "A sua password deve ter entre 8 a 16 caracteres e incluir dígitos, minúsculas e maiúsculas",
      "user[password_confirmation]": "Passwords não iguais: repita a password"
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
