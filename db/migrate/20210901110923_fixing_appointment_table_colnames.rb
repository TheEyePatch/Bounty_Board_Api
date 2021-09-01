class FixingAppointmentTableColnames < ActiveRecord::Migration[6.1]
  def change
    rename_column :appointments, :bounty_id_id, :bounty_id
    rename_column :appointments, :user_id_id, :user_id
  end
end
