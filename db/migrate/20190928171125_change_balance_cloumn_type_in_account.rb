# frozen_string_literal: true

class ChangeBalanceCloumnTypeInAccount < ActiveRecord::Migration[5.2]
  def change
    change_column :accounts, :balance, :integer
  end
end
