class AddLaboratoriesToRecordsRelated < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :laboratory_id, :integer
  	add_column :inventories, :laboratory_id, :integer
  end
end
