class AddNroRevisionToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :nr_revision, :integer, default: 0
  end
end
