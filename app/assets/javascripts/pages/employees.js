(function() {
  $(function() {
    $('#employee-datatable').DataTable({
        "pagingType": "full_numbers",
        "lengthMenu": [ 
            [10, 25, 50, -1],
            [10, 25, 50, "All"]
        ],
        responsive: true,
        destroy: true,
        language: {
            search: "_INPUT_",
            searchPlaceholder: "Buscar Empleados",
        },
    });

    $("#employee-form-datepicker").datepicker({});

    $("#employee-form").validate();
  });
})();