(function() {
  function onlyNumbers(event) {
    return (event.charCode >= 48 && event.charCode <=57) || event.charCode == 46 || event.charCode == 0;
  }

  $(function() {
    var $fields = $('.only-money-value');
    $fields.each(function(index,elem) {
      var $this = $(elem);
      $this.on('keypress', onlyNumbers);
    }) 
  })

  $('.description').css('height','100px');
})();

