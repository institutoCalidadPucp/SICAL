class AddContactPersonToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :contact_person, :string
  end
end
