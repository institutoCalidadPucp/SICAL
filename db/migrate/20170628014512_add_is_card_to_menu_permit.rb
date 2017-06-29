class AddIsCardToMenuPermit < ActiveRecord::Migration[5.1]
  def change
    add_column :menu_permits, :is_card, :boolean ,:default => false
  end
end
