class AddingMaxParticipantsColToBountyTable < ActiveRecord::Migration[6.1]
  def change
    add_column :bounties, :max_participants, :integer, :default => 1
  end
end
