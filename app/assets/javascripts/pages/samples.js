(function() {
  function onlyNumbers(event){
    return (event.charCode >= 48 && event.charCode <=57) || event.charCode==0;
  }

  $(function() {
    var $fields = $('.only-numbers');
    $fields.each(function(index,elem){
      var $this = $(elem);
      $this.on('keypress',onlyNumbers);
    });

    // var $accordions = $(".accordion");
    // $accordions.each(function(accordion) {
    //   var $accordion = $(accordion);
    //   $accordion.accordion({});
    // })
    // $accordions.each(function(accordion) {
    //   var $accordion = $(accordion);
    //   $accordion.toggleClass('active');

    //   var $panel = $accordion.next();
    //   if ($panel.css('display') == 'block' ){
    //     $panel.css('display','none');
    //   } else {
    //     $panel.css('display','block');
    //   }
    // });

    $(".removeBtn").click(function(){
      $(this).parent('button').next('div').andSelf().remove();
    });
  })

})();




