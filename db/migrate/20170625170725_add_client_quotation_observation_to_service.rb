class AddClientQuotationObservationToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :client_quotation_observation, :string
  end
end
