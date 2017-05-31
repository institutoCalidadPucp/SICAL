class AddStatusToLaboratories < ActiveRecord::Migration[5.1]
  def change
    add_column :laboratories, :status, :integer
  end
end
