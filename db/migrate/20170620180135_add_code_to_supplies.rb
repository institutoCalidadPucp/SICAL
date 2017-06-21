class AddCodeToSupplies < ActiveRecord::Migration[5.1]
  def change
    add_column :supplies, :code, :string
  end
end
