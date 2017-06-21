class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.text :description
      t.date :date_of_entry
      t.float   :amount
      t.string  :code
      t.string  :name
      t.string  :brand
      t.string  :product_model
      t.string  :amount_unit
      t.integer :status, default: 0
      t.belongs_to :laboratory
      t.timestamps
    end
  end
end
