class AddJobPositionToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :job_position, :string
  end
end
