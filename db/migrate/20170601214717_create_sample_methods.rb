class CreateSampleMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :sample_methods do |t|
    	t.string :description
    	t.float :unit_cost
    	t.integer :accreditation
    	t.belongs_to :laboratory
      t.timestamps
    end
  end
end
