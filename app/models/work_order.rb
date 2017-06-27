class WorkOrder < ApplicationRecord
  belongs_to :sample_processed
  belongs_to :employee, required: false, class_name: "User"
  belongs_to :service
  # has_one :report

  scope :work_orders_per_employee, -> (current_user) {where(employee_id: current_user.id)}
  scope :work_orders_per_supervisor, -> (current_user) {where(supervisor_id: current_user.id)}
  scope :work_orders_per_service, -> (service) {where(service_id: service.id)}

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
  
end

