class CreateContactUs < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_us do |t|
      t.belongs_to :laboratory, index: true
      t.string :subject
      t.string :message
      t.timestamps
    end
  end
end
