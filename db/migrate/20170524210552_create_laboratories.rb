class CreateLaboratories < ActiveRecord::Migration[5.1]
  def change
    create_table :laboratories do |t|
    	t.string :nombre
      t.integer :telefono
      t.string :email
      t.string :web
      t.string :direccion
      t.text :descripcion
      t.timestamps
    end
  end
end
