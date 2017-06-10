(function() {
  $(function() {
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




