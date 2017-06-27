class AddInitialFundedValidation < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :valid_initial_funded, :boolean, default: false
    add_column :services, :initial_funded_observation, :text
  end
end
