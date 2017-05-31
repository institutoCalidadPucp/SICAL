class AddStatusToRoles < ActiveRecord::Migration[5.1]
  def change
    add_column :roles, :status, :integer
  end
end
