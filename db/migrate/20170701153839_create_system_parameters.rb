class CreateSystemParameters < ActiveRecord::Migration[5.1]
  def change
    create_table :system_parameters do |t|
    	t.integer :feature
    	t.float :min
    	t.float :max
    	t.text :description
      t.timestamps
    end
  end
end
