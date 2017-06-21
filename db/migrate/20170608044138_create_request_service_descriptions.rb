class CreateRequestServiceDescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :request_service_descriptions do |t|
      t.string :sample_name
      t.integer :amount
      t.string :description
      t.timestamps
    end
  end
end
