(function() {
  $.extend($.validator.messages, {
      required: "Este campo es obligatorio.",
      remote: "Por favor corregir este campo.",
      email: "Por favor ingrese una dirección de correo válida.",
      url: "Por favor ingrese una URL válida.",
      date: "Por favor ingrese una fecha válida",
      dateISO: "Por favor ingrese una fecha válida (ISO).",
      number: "Por favor ingrese un número válido.",
      digits: "Por favor ingrese solo dígitos.",
      creditcard: "Por favor ingrese un número de tarjeta de crédito válido.",
      equalTo: "Por favor ingrese el mismo valor otra vez.",
      accept: "Por favor ingrese un valor con una extensión válida.",
      maxlength: $.validator.format("Por favor ingrese no más de {0} caracteres."),
      minlength: $.validator.format("Por favor ingrese por lo menos {0} caracteres."),
      rangelength: $.validator.format("Por favor ingrese un valor  de entre {0} y {1} caracteres de largo."),
      range: $.validator.format("Por favor ingrese un valor entre {0} y {1}."),
      max: $.validator.format("Por favor ingrese un valor menor o igual a {0}."),
      min: $.validator.format("Por favor ingrese un valor mayor o igual a {0}.")
  });

  $.validator.setDefaults({
    ignore: [],
  });

  $.validator.addMethod('onlyAdult', function(value, element) {
    return this.optional(element) || moment(moment(), 'DD/MM/YYYY').diff(moment(value, 'DD/MM/YYYY') , 'years') > 18;
  }, 'Por favor ingrese una fecha válida, solo se aceptan mayores de edad.');

  $.validator.addMethod('onlyOneOptionSelected', function(value, element) {
    console.log(value);
    console.log(element);

  }, 'Por favor solo seleccione una opcion por menu.');

  $.validator.addMethod('onlyTwoDecimals', function(value, element) {
    console.log()
    return this.optional(element) || value.split('.')[1].length <= 2;
  }, 'Por favor solo ingrese 2 decimales');

  $.validator.methods.date = function(value, element, param) {
    return this.optional(element) || moment(value, 'DD/MM/YYYY').isValid();
  };
})();