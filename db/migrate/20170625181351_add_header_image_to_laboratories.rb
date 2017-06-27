class AddHeaderImageToLaboratories < ActiveRecord::Migration[5.1]
  def change
    add_column :laboratories, :header_image, :string
  end
end
