class CreateContactUsMailers < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_us_mailers do |t|

      t.timestamps
    end
  end
end
