class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.text :description
      t.string :name
      t.integer :status, default: 0
      t.belongs_to :laboratory
      t.timestamps
    end
  end
end
