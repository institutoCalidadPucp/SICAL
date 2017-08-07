module AuditManager

  extend ActiveSupport::Concern

  included do
    # TO DO
  end

  def register_audit event, activity_type, resource_id = nil, resource_name = nil, resource_type = nil
    Audit.create event: event, activity_type: activity_type, author_id: self.id, author_name: self.full_name, author_type: self.class.to_s, resource_id: resource_id, resource_name: resource_name, resource_type: resource_type
  end

end
