class AddClassifiedValidation < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :valid_classified, :boolean, default: false
  end
end
