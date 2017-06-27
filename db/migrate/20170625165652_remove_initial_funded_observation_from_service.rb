class RemoveInitialFundedObservationFromService < ActiveRecord::Migration[5.1]
  def change
    remove_column :services, :initial_funded_observation, :string
  end
end
