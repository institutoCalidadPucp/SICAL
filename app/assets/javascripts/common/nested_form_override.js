$(function() {
  var $btnAddNestedElement = $('.btn-add-nested-element');
  var $nestedElements = $($btnAddNestedElement.data('association-insertion-node'));

  $btnAddNestedElement.on('click', function() {
    var counter = $(this).data('nested-elements');
    
    counter += 1;

    $(this).data('nested-elements', counter);
  });


  $nestedElements.on('cocoon:before-insert', function(e, insertedItem) {
    var counter = $btnAddNestedElement.data('nested-elements');
    var itemId = 'samples-values-' + counter;
    var $addSecondNestedElementBtn = $(insertedItem[0]).find('.btn-add-sample-value');

    $(insertedItem[0]).find('.samples-values').attr('id', itemId);
    $addSecondNestedElementBtn.data('id', counter);
  });

  $nestedElements.on('cocoon:after-insert', function(e, insertedItem) {
    var $addSecondNestedElementBtn = $(insertedItem[0]).find('.btn-add-sample-value');

    $addSecondNestedElementBtn.data('association-insertion-node', function(link) {
      var counter = $addSecondNestedElementBtn.data('id');
      var itemId = '#samples-values-' + counter;

      return $(itemId);
    });
  });
})