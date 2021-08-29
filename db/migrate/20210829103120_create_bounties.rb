class CreateBounties < ActiveRecord::Migration[6.1]
  def change
    create_table :bounties do |t|
      t.string :title
      t.string :description
      t.string :link
      t.belongs_to :bounty_hunter
      t.integer :reward_points
      t.string :urgency
      t.string :status
      t.string :bounty_type
      t.date :deadline
      t.date :date_finished
      t.boolean :approved, default: false
      t.timestamps
    end
  end
end
