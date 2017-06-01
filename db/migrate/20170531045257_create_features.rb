class CreateFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :features do |t|
      t.float :value
      t.string :name
      t.belongs_to :sample, index: true
      t.timestamps
    end
  end
end
