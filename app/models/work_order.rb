class WorkOrder < ApplicationRecord
  belongs_to :sample_processed
  belongs_to :employee, required: false, class_name: "User"
  belongs_to :service
  mount_uploader :internal_report, DocumentUploader

  scope :work_orders_per_employee, -> (current_user) {where(employee_id: current_user.id)}
  scope :work_orders_per_supervisor, -> (current_user) {where(supervisor_id: current_user.id)}
  scope :work_orders_per_service, -> (service) {where(service_id: service.id)}
  scope :work_orders_per_related, -> (current_user) {where(employee_id: current_user.id).or(where(supervisor_id: current_user.id))}

  enum work_flow: [:to_work,:to_check,:to_rework,:completed]
  
   def self.work_orders_to_work current_user
    work_orders_per_employee(current_user).to_work
   end

   def self.work_orders_to_rework current_user
    work_orders_per_employee(current_user).to_rework
   end

   def self.work_orders_to_check current_user
    work_orders_per_supervisor(current_user).to_check
   end

   def self.work_orders_completed current_user
    work_orders_per_supervisor(current_user).completed
   end

   def self.work_orders_related current_user
     work_orders_per_related(current_user)
   end

   def handling_internal_process current_user
      incredRevision = false
      if self.to_rework?
        increseRevision = true
      end            
      self.to_check! if self.to_rework?
      self.completed! if self.to_check? and self.valid_supervised      
      self.to_rework! if ((self.to_check? and !increseRevision) and !self.valid_supervised)                        
      self.to_check! if self.to_work?  
   end  

   def assign_attr params, current_user, sample_processed, index, service
    work_order_params = {service_id: service.id, supervisor_id: current_user.id}
    work_order_params[:subject] = service.subject + sample_processed.pucp_code
    work_order_params[:employee_id] = params["selected_employee_" + index.to_s]
    work_order_params[:sample_processed_id] = sample_processed.id
    self.assign_attributes work_order_params
   end
  
end

