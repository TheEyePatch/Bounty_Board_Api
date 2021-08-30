# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :bounty_hunter
      t.belongs_to :bounty
      t.string :body
      t.timestamps
    end
  end
end
