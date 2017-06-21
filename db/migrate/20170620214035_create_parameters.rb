class CreateParameters < ActiveRecord::Migration[5.1]
  def change
    create_table :parameters do |t|
      t.integer :max_priority
      t.integer :max_attempts

      t.timestamps
    end
  end
end
