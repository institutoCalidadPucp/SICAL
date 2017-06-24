class CreateSampleCategoryxSampleMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :sample_categoryx_sample_methods do |t|
      t.timestamps
    end
  end
end
