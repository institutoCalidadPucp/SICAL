class AddNrRevisionToCustodyOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :custody_orders, :nr_revision, :integer,:default => 0
    add_column :custody_orders, :work_flow, :integer,:default => 0
    add_column :custody_orders, :valid_supervised, :boolean,:default => false
  end
end
