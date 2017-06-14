class CreateSamplePreliminaries < ActiveRecord::Migration[5.1]
  def change
    create_table :sample_preliminaries do |t|
      t.belongs_to :service
      t.string :name
      t.string :quantity
      t.string :description

      t.timestamps
    end
  end
end
