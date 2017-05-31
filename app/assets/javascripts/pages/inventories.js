(function() {
  $(function() {
    $('#inventories-table').DataTable({
        "pagingType": "full_numbers",
        "lengthMenu": [ 
            [10, 25, 50, -1],
            [10, 25, 50, "All"]
        ],
        responsive: true,
        destroy: true,
        language: {
            search: "_INPUT_",
            searchPlaceholder: "Buscar Item",
        },
    });
    $("#employee-form-datepicker").datepicker({});
  });
})();