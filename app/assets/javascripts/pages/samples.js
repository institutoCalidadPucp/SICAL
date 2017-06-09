(function() {
  function onlyNumbers(event){
    return (event.charCode >= 48 && event.charCode <=57) || event.charCode==0;
  }

  $(function() {
    var $fields = $('.only-numbers');
    $fields.each(function(index,elem){
      var $this = $(elem);
      $this.on('keypress',onlyNumbers);
    })
  })

  $(".removeBtn").click(function(){
    $(this).parent('button').next('div').andSelf().remove();
  });

  $(function(){
    var $accordions = $(".accordion");
    $accordions.each(function (accordion) {
      var $accordion = $(accordion);
      this.classList.toggle("active");
      var panel = this.nextElementSibling;
      if (panel.style.display === "block") {
          panel.style.display = "none";
      } else {
          panel.style.display = "block";
      }
    })
  })
  

})();




