class AddFinalClientCheckToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :final_client_check, :boolean
  end
end
