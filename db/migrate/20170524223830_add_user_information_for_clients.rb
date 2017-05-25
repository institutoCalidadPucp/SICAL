class AddUserInformationForClients < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :ruc, :string
  	add_column :users, :name, :string
  	add_column :users, :phone, :string
  	add_column :users, :address, :string
  	add_column :users, :username, :string
  end
end
