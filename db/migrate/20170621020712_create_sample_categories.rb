class CreateSampleCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :sample_categories do |t|
    	t.belongs_to :laboratory
        t.string :name
        t.string :description
        t.integer :status, default: 0
      t.timestamps
    end
  end
end
