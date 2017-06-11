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
    var isDateOfBirth = datepicker.attr('birth');
    var startDate = isDateOfBirth == 'true' ? "" : "today";

    datepicker.datepicker({
      startDate: startDate,
      format: 'dd/mm/yyyy',
    });

    datepicker.attr(dataName, true);
  }

  function addFormValidation(form, dataName) {
    // var $temp = form.find(':input');
    // var $inputs = $temp.slice(2, $temp.length - 1);

    // console.log($inputs);
    // console.log($(form).attr('prefix'));
    form.validate({
      errorPlacement: function(error, element) {
        var $element = $(element);

        $element.closest('.input-wrapper').append(error);
      }
    });
    // form.attr(dataName, true);
  }

  function onlyNumbers(e) {
    // Allow: backspace, delete, tab, escape, enter and .
    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
      (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) || // Allow: Ctrl/cmd+A
      (e.keyCode == 67 && (e.ctrlKey === true || e.metaKey === true)) || // Allow: Ctrl/cmd+C
      (e.keyCode == 88 && (e.ctrlKey === true || e.metaKey === true)) || // Allow: Ctrl/cmd+X
      (e.keyCode >= 35 && e.keyCode <= 39)) { // Allow: home, end, left, right
        return; // let it happen, don't do anything
      }

    // Ensure that it is a number and stop the keypress
    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
        e.preventDefault();
    }
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
        case 'form-validated':
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
    var $onlyNumbersFields = $('.only-numbers');
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

    $onlyNumbersFields.each(function(index,elem) {
      var $this = $(elem);

      $this.on('keypress', onlyNumbers);
    }) 

    $loader.addClass('hidden');
    $content.removeClass('hidden');
  });
})();