class AddClassifiedValuesToSampleProcessed < ActiveRecord::Migration[5.1]
  def change
    add_column :sample_processeds, :classified_values, :text
  end
end
