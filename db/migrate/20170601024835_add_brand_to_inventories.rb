class AddBrandToInventories < ActiveRecord::Migration[5.1]
  def change
    add_column :inventories, :brand, :string
  end
end
