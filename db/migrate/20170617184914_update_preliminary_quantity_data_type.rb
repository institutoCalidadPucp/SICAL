class UpdatePreliminaryQuantityDataType < ActiveRecord::Migration[5.1]
  def change
    remove_column :sample_preliminaries, :quantity
    add_column :sample_preliminaries, :quantity, :integer, default: 1
  end 
end