class AddXTableIdToChainFeatures < ActiveRecord::Migration[5.1]
  def change
    add_column :chain_features, :sample_categoryx_sample_method_id, :integer
  end
end
