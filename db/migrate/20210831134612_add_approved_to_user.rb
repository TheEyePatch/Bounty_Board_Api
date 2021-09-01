class AddApprovedToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :approved, :boolean, :default => false, :null => false
    add_column :users, :verified_by, :bigint
  end
end
