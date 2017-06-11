class CreateSampleProcesseds < ActiveRecord::Migration[5.1]
  def change
    create_table :sample_processeds do |t|
      t.belongs_to :service
      t.string :category
      t.string :description
      t.string :pucp_code
      t.string :client_code

      t.timestamps
    end
  end
end
