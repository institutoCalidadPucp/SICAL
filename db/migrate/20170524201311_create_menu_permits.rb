class CreateMenuPermits < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_permits do |t|
      t.boolean :view_permit, default: false
      t.boolean :create_permit, default: false
      t.boolean :edit_permit, default: false
      t.boolean :delete_permit, default: false
      t.boolean :available_for_client, default: false
      t.boolean :default, default: false
      t.string :name
      t.string :tab_reference
      t.string :tab_icon
      t.integer :order
      t.belongs_to :role, index: true
      t.timestamps
    end
  end
end
