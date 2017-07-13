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
  var sampleMethods;
  var currency = '';
  var $totalInput = $('#quotation-total-input');
  var totalInputValue = $totalInput.length ? parseFloat($totalInput.attr('value').substr(currency.length), 2) : 0;

  function substractPreviousSubTotal(targetId) {
    var $unitCostInput = $('#sample-preliminaries-unit-cost-' + targetId);
    var $subTotalInput = $('#sample-preliminaries-sub-total-' + targetId);

    totalInputValue = totalInputValue - parseFloat($subTotalInput.attr('value').substr(currency.length), 2) ;
    $unitCostInput.attr('value', '0.0');
    $subTotalInput.attr('value', '0.0');
    $totalInput.attr('value', currency + (totalInputValue > 0 ? totalInputValue : '0.0') );
  }

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
        sampleMethods = response.sample_methods;
        var target = '#sample-preliminaries-method-' + $targetId;
        var $target = $(target);

        $target.find('option').remove();
        $target.append($('<option>'));

        $.each(sampleMethods, function(index, element) {
          $target.append($('<option>', {
            value: element.id,
            text:  element.name,
            order: index,
          }));
        });

        substractPreviousSubTotal($targetId);
      },
      error: function(error) {
        var target = '#sample-preliminaries-method-' + $targetId;
        var $target = $(target);

        $target.find('option').remove();
        substractPreviousSubTotal($targetId);
      },
    })
  });

  $('.sample-preliminaries-method-select').on('change', function(e) {
    var $targetId = $(this).data('id');

    if (e.target.value) {
      var $unitCostInput = $('#sample-preliminaries-unit-cost-' + $targetId);
      var $subTotalInput = $('#sample-preliminaries-sub-total-' + $targetId);
      var $sampleQuantityInput = $('#sample-preliminaries-quantity-' +$targetId);
      var sampleMethod = sampleMethods[$(e.target).find(":selected").attr('order')];
      var sampleQuantity = ~~($sampleQuantityInput.attr('value'));
      
      totalInputValue += sampleMethod.unit_cost * sampleQuantity;
      $totalInput.attr('value', currency + totalInputValue);
      $unitCostInput.attr('value', currency + sampleMethod.unit_cost);
      $subTotalInput.attr('value', currency + (sampleMethod.unit_cost * sampleQuantity));
    } else {
      substractPreviousSubTotal($targetId);
    }
  });
})();