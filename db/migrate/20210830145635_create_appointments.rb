# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments, &:timestamps
  end
end
