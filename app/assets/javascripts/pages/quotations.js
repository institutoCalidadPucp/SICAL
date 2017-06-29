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
    var $targetId = $(this).data('id');

    $.ajax({
      url: '/quotations/get_sample_methods',
      method: 'POST',
      dataType: 'json',
      data: {
        id: e.target.value,
        authenticity_token: window._token,
      },
      success: function(response) {
        var methods = response.sample_methods;
        var target = '#sample-preliminaries-method-' + $targetId;
        var $target = $(target);

        $target.find('option').remove();
        $target.append($('<option>'));

        var options = $.each(methods, function(index, element) {
          $target.append($('<option>', {
            value: element.id,
            text:  element.name,
          }));
        });
      },
      error: function(error) {
        var target = '#sample-preliminaries-method-' + $targetId;
        var $target = $(target);

        $target.find('option').remove();
      },
    })
  });
})();