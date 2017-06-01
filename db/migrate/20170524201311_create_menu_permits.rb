class CreateMenuPermits < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_permits do |t|
      t.boolean :view_permit, default: false
      t.boolean :create_permit, default: false
      t.boolean :edit_permit, default: false
      t.boolean :delete_permit, default: false
      t.belongs_to :role, index: true
      t.string :name
      t.timestamps
    end
  end
end
