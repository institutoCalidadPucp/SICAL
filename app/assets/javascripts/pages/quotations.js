$(".sample-header").click(function () {

    $header = $(this);
    $content = $header.next();
    $content.slideToggle(500, function () {
        $header.text(function () {
            return $content.is(":visible") ? "Menos Detalles" : "Mas Detalles";
        });
    });

});

$("#rejected").on('change', function() {
  if (this.checked) {
    $(".engagement-observation").show(); 
  } else {
    $(".engagement-observation").hide();
  }
});

(function() {
  $('.sample-preliminaries-category-select').on('change', function(e) {
    $.ajax({
      url: '/quotations/get_sample_methods',
      method: 'POST',
      data: {
        id: e.target.value,
        authenticity_token: window._token,
      },
      done: function(response) {
        console.log(response);
      },
      fail: function(error) {
        console.log(error);
      },
    })
  });
})();