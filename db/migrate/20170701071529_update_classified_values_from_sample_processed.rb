class UpdateClassifiedValuesFromSampleProcessed < ActiveRecord::Migration[5.1]
  def change    
      enable_extension 'hstore'
      remove_column :sample_processeds, :classified_values, :text
      add_column :sample_processeds, :classified_values, :hstore, default: {}, null: false 
  end
end
