class AddUserInformationForEmployee < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :last_name, :string
  	add_column :users, :date_of_birth, :datetime
  	add_column :users, :gender, :integer
  end
end
