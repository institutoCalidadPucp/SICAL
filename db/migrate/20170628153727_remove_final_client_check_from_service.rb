class RemoveFinalClientCheckFromService < ActiveRecord::Migration[5.1]
  def change
    remove_column :services, :final_client_check, :string
     add_column :services, :final_client_check, :boolean, :default => false
  end
end
