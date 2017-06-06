class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :laboratory
      t.string :topic
      t.timestamps
    end
  end
end
