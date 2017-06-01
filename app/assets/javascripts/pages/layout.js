(function() {
  function addDropdown(dropdown, dataName) {
    dropdown.dropdown();
    dropdown.attr(dataName, true);
  }

  function addTable(table, dataName) {
    table.DataTable({
      "pagingType": "full_numbers",
      "lengthMenu": [ 
        [10, 25, 50, -1],
        [10, 25, 50, "All"]
      ],
      responsive: true,
      destroy: true,
      language: {
        search: "_INPUT_",
        searchPlaceholder: "Buscar Laboratorios",
      },
    });

    table.attr(dataName, true);
  }

  function initializeElements(index, element, name) {
    var $element = $(element);
    var dataName = name + '-attached';

    if (!$element.attr(dataName)) {
      switch(name) {
        case 'dropdown':
          addDropdown($element, dataName);
          break;
        case 'table':
          addTable($element, dataName);
          break;
        default:
          break;
      }
    }
  }

  $(function() {
    var $dropdowns = $('.sical-dropdown');
    var $tables = $('.sical-data-table');
    var $loader = $('#loader');
    var $content = $('#content');

    $dropdowns.each(function(index, element) {
      initializeElements(index, element, 'dropdown');
    });

    $tables.each(function(index, element) {
      console.log(index, element);
      initializeElements(index, element, 'table');
    });

    setTimeout(function () {
      $loader.addClass('hidden');
      $content.removeClass('hidden');
    }, 500);
  });

})();