class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :tittle
      t.string :topic
      t.string :description
      t.integer :code
      t.integer :stage, default: 0
      t.integer :status, default: 0
      t.datetime :shipping_date
      t.belongs_to :laboratory
      t.timestamps
    end
  end
end
