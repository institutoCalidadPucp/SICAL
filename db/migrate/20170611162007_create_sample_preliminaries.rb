class CreateSamplePreliminaries < ActiveRecord::Migration[5.1]
  def change
    create_table :sample_preliminaries do |t|
      t.string :name
      t.integer :quantity
      t.string :description

      t.timestamps
    end
  end
end
