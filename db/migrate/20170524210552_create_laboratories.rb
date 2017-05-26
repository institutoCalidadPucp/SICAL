class CreateLaboratories < ActiveRecord::Migration[5.1]
  def change
    create_table :laboratories do |t|
    	t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.text :description
      t.timestamps
    end
  end
end
