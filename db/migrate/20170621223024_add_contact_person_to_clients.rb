class AddContactPersonToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :person_contact, :string
  end
end
