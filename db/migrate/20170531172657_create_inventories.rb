class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.string :inventoryCode
      t.string :description

      t.timestamps
    end
  end
end
