class AddLifetimeToInventories < ActiveRecord::Migration[5.1]
  def change
    add_column :inventories, :lifetime, :float
  end
end
