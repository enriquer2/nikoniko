# frozen_string_literal: true

class ChangeRoleToUsers < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :role, :integer, default: 3
  end

  def down
    change_column :users, :role, :integer, default: nil
  end
end
