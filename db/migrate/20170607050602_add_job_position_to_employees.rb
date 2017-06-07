class AddJobPositionToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :job_position, :string
  end
end
