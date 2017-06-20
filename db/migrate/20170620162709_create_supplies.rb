class CreateSupplies < ActiveRecord::Migration[5.1]
  def change
    create_table :supplies do |t|
      t.integer :laboratory_id
      t.string :name
      t.string :description
      t.float :quantity
      t.string :measureUnit

      t.timestamps
    end
  end
end
