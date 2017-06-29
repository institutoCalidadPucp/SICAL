class AddSupervisorObservationToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :supervisor_observation, :string
  end
end
