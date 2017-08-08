# frozen_string_literal: true

class CreateFeelings < ActiveRecord::Migration[5.1]
  def change
    create_table :feelings do |t|
      t.date :day
      t.integer :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
