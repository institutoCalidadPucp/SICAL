class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.belongs_to :laboratory
      t.belongs_to :user
      t.string :subject
      t.date :pick_up_date

      t.timestamps
    end
  end
end
