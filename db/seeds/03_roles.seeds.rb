Role.create(name: "Jefe de Laboratorio", description: "test", laboratory_id: 1, status: 0)
MenuPermit.create(name: 'Empleados', tab_reference: 'employees', tab_icon: 'ti-user', available_for_client: false, order: 1, default: false, role_id: 1, full_permit: true)
MenuPermit.create(name: 'Cliente', tab_reference: 'clients', tab_icon: 'ti-user', available_for_client: false, order: 2, default: false, role_id: 1, full_permit: true)	
MenuPermit.create(name: 'Inventario', tab_reference: 'inventories', tab_icon: 'ti-package', available_for_client: false, order: 3, default: false, role_id: 1, full_permit: true)
MenuPermit.create(name: 'Metodos de Ensayo', tab_reference: 'sample_methods', tab_icon: 'ti-panel', available_for_client: false, order: 4, default: false, role_id: 1, full_permit: true)
MenuPermit.create(name: 'Categoría de Muestra', tab_reference: 'sample_categories', tab_icon: 'ti-ruler', available_for_client: false, order: 5, default: false, role_id: 1, full_permit: true)
MenuPermit.create(name: 'Solicitudes de servicio', tab_reference: 'check_services', tab_icon: 'ti-clipboard', available_for_client: false, order: 6, default: false, role_id: 1, full_permit: true)
MenuPermit.create(name: 'Proformas', tab_reference: 'quotations', tab_icon: 'ti-money', available_for_client: false, order: 7, default: false, role_id: 1, full_permit: true)
MenuPermit.create(name: 'Cadena de Custodia', tab_reference: 'classified_services', tab_icon: 'ti-hummer', available_for_client: false, order: 8, default: false, role_id: 1, full_permit: true)
MenuPermit.create(name: 'Ejecución de servicios', tab_reference: 'services', tab_icon: 'ti-hummer', available_for_client: false, order: 9, default: false, role_id: 1, full_permit: true)
MenuPermit.create(name: 'Orden de Trabajo', tab_reference: 'work_orders', tab_icon: 'ti-hummer', available_for_client: false, order: 10, default: false, role_id: 1, full_permit: true)
MenuPermit.create(name: 'Roles', tab_reference: 'roles', tab_icon: 'ti-id-badge', available_for_client: false, order: 11, default: false, role_id: 1, full_permit: true)
MenuPermit.create(name: 'Paremetros del sistema ', tab_reference: 'system_parameters', tab_icon: 'ti-write', available_for_client: false, order: 12, default: false, role_id: 1, full_permit: true)
MenuPermit.create(name: 'Auditoria ', tab_reference: 'audits', tab_icon: 'ti-write', available_for_client: false, order: 14, default: false, role_id: 1, full_permit: true)
MenuPermit.create(name: 'Contactenos ', tab_reference: 'contact_us/new', tab_icon: 'ti-write', available_for_client: false, order: 15, default: false, role_id: 1, full_permit: true)
Role.create(name: "Analista", description: "test", laboratory_id: 1, status: 0)
MenuPermit.create(name: 'Orden de Custodia', tab_reference: 'work_classified_services', tab_icon: 'ti-hummer', available_for_client: false, order: 2, default: false, role_id: 2, full_permit: true)
MenuPermit.create(name: 'Orden de Trabajo', tab_reference: 'work_orders', tab_icon: 'ti-hummer', available_for_client: false, order: 3, default: false, role_id: 2, full_permit: true)
