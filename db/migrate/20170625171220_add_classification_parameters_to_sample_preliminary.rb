class AddClassificationParametersToSamplePreliminary < ActiveRecord::Migration[5.1]
  def change
    add_column :sample_preliminaries, :unit_cost, :float, :default => 0
    add_column :sample_preliminaries, :sample_category_id, :integer
    add_column :sample_preliminaries, :sample_method_id, :integer
  end
end
