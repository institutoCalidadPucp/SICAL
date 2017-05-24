class CreateMenuPermits < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_permits do |t|
      t.belongs_to :menu, index: true
      t.belongs_to :permit, index: true
      t.timestamps
    end
  end
end
