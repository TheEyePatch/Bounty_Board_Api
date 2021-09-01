class FixingAppointmentTableColnames2 < ActiveRecord::Migration[6.1]
  def change
    rename_column :appointments, :user_id, :bounty_hunter_id
  end
end
