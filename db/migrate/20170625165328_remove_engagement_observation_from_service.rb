class RemoveEngagementObservationFromService < ActiveRecord::Migration[5.1]
  def change
    remove_column :services, :engagement_observation, :string
  end
end
