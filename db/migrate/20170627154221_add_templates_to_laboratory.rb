class AddTemplatesToLaboratory < ActiveRecord::Migration[5.1]
  def change
    add_column :laboratories, :internal_report, :string
    add_column :laboratories, :accredited_report, :string
    add_column :laboratories, :normal_report, :string
  end
end
