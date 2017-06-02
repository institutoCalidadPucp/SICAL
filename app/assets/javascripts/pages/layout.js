(function() {
  function addDropdown(dropdown, dataName) {
    dropdown.dropdown();
    dropdown.attr(dataName, true);
  }

  function addTable(table, dataName) {
    var tablePlaceholder = table.data('placeholder');

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
        searchPlaceholder: tablePlaceholder,
      },
    });

    table.attr(dataName, true);
  }

  function addDatePicker(datepicker, dataName) {
    datepicker.datepicker({});
    datepicker.attr(dataName, true);
  }

  function addFormValidation(form, dataName) {
    form.validate();
    form.attr(dataName, true);
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
        case 'datepicker':
          addDatePicker($element, dataName);
          break;
        case 'validate':
          addFormValidation($element, dataName);
        default:
          break;
      }
    }
  }

  $(function() {
    var $dropdowns = $('.sical-dropdown');
    var $tables = $('.sical-data-table');
    var $datepickers = $('.sical-datepicker');
    var $formsValidated = $('.sical-form-validated');
    var $loader = $('#loader');
    var $content = $('#content');
    var $elements = {
      'dropdown': $dropdowns,
      'table': $tables,
      'datepicker': $datepickers,
      'form-validated': $formsValidated,
    };

    $.each($elements, function(key, value) {
      value.each(function(index, element) {
        initializeElements(index, element, key);
      });
    });

    $loader.addClass('hidden');
    $content.removeClass('hidden');
  });
})();