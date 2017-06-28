class AddSubTotal < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :subtotal, :float
  end
end
