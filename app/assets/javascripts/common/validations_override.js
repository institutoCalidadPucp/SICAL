jQuery.extend(jQuery.validator.messages, {
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
    maxlength: jQuery.validator.format("Por favor ingrese no más de {0} caracteres."),
    minlength: jQuery.validator.format("Por favor ingrese por lo menos {0} caracteres."),
    rangelength: jQuery.validator.format("Por favor ingrese un valor  de entre {0} y {1} caracteres de largo."),
    range: jQuery.validator.format("Por favor ingrese un valor entre {0} y {1}."),
    max: jQuery.validator.format("Por favor ingrese un valor menor o igual a {0}."),
    min: jQuery.validator.format("Por favor ingrese un valor mayor o igual a {0}.")
});