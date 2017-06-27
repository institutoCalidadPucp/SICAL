class AddSupervisorQuotationObservationToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :supervisor_quotation_observation, :string
  end
end
