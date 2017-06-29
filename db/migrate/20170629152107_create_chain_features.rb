class CreateChainFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :chain_features do |t|
      t.string :concept
      t.float :lower_range
      t.float :upper_range

      t.timestamps
    end
  end
end
