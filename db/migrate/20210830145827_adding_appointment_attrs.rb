# frozen_string_literal: true

class AddingAppointmentAttrs < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :bounty_id, :integer
    add_column :appointments, :user_id, :integer
  end
end
