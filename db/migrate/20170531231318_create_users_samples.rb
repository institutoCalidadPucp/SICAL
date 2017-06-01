class CreateUsersSamples < ActiveRecord::Migration[5.1]
  def change
    create_table :users_samples do |t|
      t.belongs_to :user, index: true
      t.belongs_to :sample, index: true
      t.timestamps
    end
  end
end
