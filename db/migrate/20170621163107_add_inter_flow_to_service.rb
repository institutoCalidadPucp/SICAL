class AddInterFlowToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :intern_flow, :integer, default: 0
  end
end
