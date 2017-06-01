(function() {
  $(function() {
    var $dropdowns = $('.sical-dropdown');
    
    $dropdowns.each(function (index, dropdown) {
      var $dropdown = $(dropdown);

      if (!$dropdown.data('dropdown-attached')) {
        $dropdown.dropdown();
        $dropdown.data('datepicker-attached', true);
      }
    });
  })
})();