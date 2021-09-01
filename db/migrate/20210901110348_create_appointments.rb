class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.belongs_to :bounty_id
      t.belongs_to :user_id
      t.timestamps
    end
  end
end
