class CreateSampleFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :sample_features do |t|
      t.belongs_to :sample_processed
      t.string :description
      t.string :value

      t.timestamps
    end
  end
end
