class AddFullPermitToMenuPermit < ActiveRecord::Migration[5.1]
  def change
    add_column :menu_permits, :full_permit, :boolean, :default => false
  end
end
