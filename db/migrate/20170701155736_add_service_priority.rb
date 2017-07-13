class AddServicePriority < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :priority, :integer
  end
end
