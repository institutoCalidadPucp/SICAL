class AddDateOfEntryToInventories < ActiveRecord::Migration[5.1]
  def change
    add_column :inventories, :date_of_entry, :date
  end
end
