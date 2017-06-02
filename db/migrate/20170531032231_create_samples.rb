class CreateSamples < ActiveRecord::Migration[5.1]
  def change
    create_table :samples do |t|
      t.string :description
      t.string :category
      t.timestamps
    end
  end
end
