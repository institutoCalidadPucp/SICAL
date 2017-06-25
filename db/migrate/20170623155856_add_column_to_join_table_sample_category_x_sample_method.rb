class AddColumnToJoinTableSampleCategoryXSampleMethod < ActiveRecord::Migration[5.1]
  def change
  	add_column :sample_categoryx_sample_methods, :sample_category_id, :integer
    add_column :sample_categoryx_sample_methods, :sample_method_id, :integer
  end
end
