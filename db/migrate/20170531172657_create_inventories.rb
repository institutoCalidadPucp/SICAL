class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.string  :code
      t.string  :name
      t.string  :brand
      t.string  :product_model
      t.integer :status
      t.float   :float
      t.text :description
      t.date :date_of_entry
      t.timestamps
    end
  end
end
