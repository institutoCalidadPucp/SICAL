module AuditManager

  extend ActiveSupport::Concern

  included do
    # TO DO
  end

  def register_audit event, activity_type, resource_id = nil, resource_name = nil, resource_type = nil
    set_message(activity_type, resource_type, event)
    #Audit.create event: set_message(activity_type, resource_type, event), activity_type: activity_type, author_id: self.id, author_name: self.full_name, author_type: self.class.to_s, resource_id: resource_id, resource_name: resource_name, resource_type: resource_type
  end

 def set_message(activity_type, resource_type, event)
    event.nil? ? Audit.activities[:activity_type] + " " + resource_type  : event
  end
end
