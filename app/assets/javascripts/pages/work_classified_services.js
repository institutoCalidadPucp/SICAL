(function() {
  $(function() {
    var $btnEvaluationSample = $('.btn-add-evalution-sample');
    var $sampleEvaluations = $('.sample-evaluations');

    $btnEvaluationSample.on('click', function() {
      var counter = $(this).data('evaluation-samples');
      
      counter += 1;

      $(this).data('evaluation-samples', counter);
    });


    $sampleEvaluations.on('cocoon:before-insert', function(e, insertedItem) {
      var counter = $btnEvaluationSample.data('evaluation-samples');
      var itemId = 'samples-values-' + counter;

      $(insertedItem[0]).find('.samples-values').attr('id', itemId);
    });

    $sampleEvaluations.on('cocoon:after-insert', function(e, insertedItem) {
      $('.btn-add-sample-value').data('association-insertion-node', function(link) {
        var counter = $btnEvaluationSample.data('evaluation-samples');
        var itemId = '#samples-values-' + counter;

        return $(itemId);
      });
    });
  })
})();