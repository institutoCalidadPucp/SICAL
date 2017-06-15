$(".header").click(function () {

    $header = $(this);
    $content = $header.next();
    $content.slideToggle(500, function () {
        $header.text(function () {
            return $content.is(":visible") ? "Menos Detalles" : "Mas Detalles";
        });
    });

});

$("#rejected").change(function(){
  if (this.checked){
    $(".engagement-observation").show(); 
  }
  else{
    $(".engagement-observation").hide();
  }
})