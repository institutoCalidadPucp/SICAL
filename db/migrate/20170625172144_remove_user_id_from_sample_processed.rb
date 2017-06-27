class RemoveUserIdFromSampleProcessed < ActiveRecord::Migration[5.1]
  def change
    remove_column :sample_processeds, :user_id, :integer
  end
end
