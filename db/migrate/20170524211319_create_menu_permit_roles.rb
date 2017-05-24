class CreateMenuPermitRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_permit_roles do |t|
      t.belongs_to :menu_permit, index: true
      t.belongs_to :role, index:true
      t.timestamps
    end
  end
end
