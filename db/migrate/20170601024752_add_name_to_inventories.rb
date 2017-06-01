class AddNameToInventories < ActiveRecord::Migration[5.1]
  def change
    add_column :inventories, :name, :string
  end
end
