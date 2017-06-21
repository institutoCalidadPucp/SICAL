class CreateQuotations < ActiveRecord::Migration[5.1]
  def change
    create_table :quotations do |t|
      t.float :total
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
