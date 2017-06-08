class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :laboratory
      t.string :topic
      t.integer :status, default: 1
      t.integer :code
      t.datetime :shipping_date
      t.timestamps
    end
  end
end
