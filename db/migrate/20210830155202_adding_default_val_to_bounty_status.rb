class AddingDefaultValToBountyStatus < ActiveRecord::Migration[6.1]
  def change
    change_column_default :bounties, :status, "available"
  end
end
