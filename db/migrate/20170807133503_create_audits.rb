class CreateAudits < ActiveRecord::Migration[5.1]
  def change
    create_table :audits do |t|
      t.string :event,            null: false
      t.integer :activity_type,   null: false
      t.integer :author_id,       foreign_key: false
      t.string :author_type
      t.string :author_name
      t.integer :resource_id,     foreign_key: false
      t.string :resource_name
      t.string :resource_type
      t.integer :laboratory_id,     foreign_key: false
      t.string :laboratory_name
      t.timestamps
    end
  end
end
