class DashboardController < ApplicationController	
	before_action :set_dashboar_nums, only: [:index]
	def index			
	end

	def set_dashboar_nums
		@values_index = {}
		@user_menus.each do |menu|
			@values_index[menu.tab_reference] = get_card_num menu.tab_reference
		end
	end

	def get_card_num permit_tab
		if permit_tab == "work_classified_services"
			custody_orders_to_work_count = (CustodyOrder.custody_orders_to_work current_user).count
    		custody_orders_to_rework_count = (CustodyOrder.custody_orders_to_rework current_user).count			
			return custody_orders_to_work_count + custody_orders_to_rework_count
		end
		if permit_tab == "work_orders"
			work_orders_to_work_count = (WorkOrder.work_orders_to_work current_user).count
    		work_orders_to_rework_count = (WorkOrder.work_orders_to_rework current_user).count
			return work_orders_to_work_count + work_orders_to_rework_count
		end
	    if permit_tab == "services"			
    		work_orders_to_check_count = (WorkOrder.work_orders_to_check current_user).count 	
    		completed_services_count = (Service.services_completed current_user).count
			return work_orders_to_check_count + completed_services_count
		end
		if permit_tab == "quotations"			
			if current_user.employee?
				initial_unfunded_count = (Service.quotations_without_funded current_user).count
				services_to_adjusts_count = (Service.passed_classification current_user).count
				contract_bound_services_count = (Service.contract_bound current_user).count    
				return initial_unfunded_count + services_to_adjusts_count + contract_bound_services_count
			else
				initial_funded_count = (Service.quotations_with_initial_funded current_user).count
				adjusted_services_count = (Service.adjusted_by_lab_leader current_user).count
				return initial_funded_count + adjusted_services_count
			end
		end
		if permit_tab == "classified_services"			
			services_unclassified_count = (Service.inital_funded_accepted current_user).count
    		custody_order_to_check_count = (CustodyOrder.custody_orders_to_check current_user).count      
			return services_unclassified_count + custody_order_to_check_count
		end
	end
end
