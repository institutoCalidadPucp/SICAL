class AddLaboratoriesToRecordsRelated < ActiveRecord::Migration[5.1]
  def change
  	add_reference :users, :laboratory, index: true
  end
end
