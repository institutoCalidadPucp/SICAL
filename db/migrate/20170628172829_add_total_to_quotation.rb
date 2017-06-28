class AddTotalToQuotation < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :total, :float
  end
end
