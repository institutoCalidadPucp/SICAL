class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.belongs_to :laboratory, index: true
      t.belongs_to :user, index: true
      t.string :subject
      t.date :pick_up_date
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
