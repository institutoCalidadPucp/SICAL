class CustodyOrder < ApplicationRecord

  belongs_to :sample_preliminary
  belongs_to :employee, required: false, class_name: "User"
  belongs_to :service
  has_one :sample_processed

  scope :custody_orders_per_employee, -> (current_user) {where(employee_id: current_user.id)}
  scope :custody_orders_per_supervisor, -> (current_user) {where(supervisor_id: current_user.id)}
  scope :custody_orders_per_service, -> (service) {where(service_id: service.id)}
  scope :custody_orders_per_related, -> (current_user) {where(employee_id: current_user.id).or(CustodyOrder.where(supervisor_id: current_user.id))}

  enum work_flow: [:to_work,:to_check,:to_rework,:completed]
  
   def self.custody_orders_to_work current_user
    custody_orders_per_employee(current_user).to_work
   end

   def self.custody_orders_to_rework current_user
    custody_orders_per_employee(current_user).to_rework
   end

   def self.custody_orders_to_check current_user
    custody_orders_per_supervisor(current_user).to_check
   end

   def self.custody_orders_completed current_user
    custody_orders_per_supervisor(current_user).completed
   end

   def self.custody_orders_related current_user
    custody_order_per_related(current_user)
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

   def assign_attr params, current_user, sample_preliminary, index, service
    custody_order_params = {service_id: service.id, supervisor_id: current_user.id}
    custody_order_params[:subject] = service.subject + " " + sample_preliminary.sample_category.name
    custody_order_params[:employee_id] = params["selected_employee_" + sample_preliminary.id.to_s]
    custody_order_params[:sample_preliminary_id] = sample_preliminary.id
    self.assign_attributes custody_order_params
   end

end
