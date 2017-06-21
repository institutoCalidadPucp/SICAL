class AddNameToSamplemethods < ActiveRecord::Migration[5.1]
  def change
    add_column :sample_methods, :name, :string
  end
end