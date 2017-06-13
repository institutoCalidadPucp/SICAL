Role.create(name: "Role Test 1", description: "test", laboratory_id: 1, status: 0)
MenuPermit.create(name: 'Solicitudes de servicio', tab_reference: 'services', tab_icon: 'ti-clipboard', available_for_client: false, order: nil, default: false, role_id: 1)
MenuPermit.create(name: 'Proformas', tab_reference: 'quotations', tab_icon: 'ti-clipboard', available_for_client: false, order: nil, default: false, role_id: 1)
MenuPermit.create(name: 'Orden de Trabajo', tab_reference: 'work_orders', tab_icon: 'ti-hummer', available_for_client: false, order: nil, default: false, role_id: 1)
