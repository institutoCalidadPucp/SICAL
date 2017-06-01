class ChangeDescriptionFormat < ActiveRecord::Migration[5.1]
  def up
    change_column :inventories, :description, :text
  end

  def down
    change_column :inventories, :description, :string
  end
end
