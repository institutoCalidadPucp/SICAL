class AddModelToInventories < ActiveRecord::Migration[5.1]
  def change
    add_column :inventories, :model, :string
  end
end
