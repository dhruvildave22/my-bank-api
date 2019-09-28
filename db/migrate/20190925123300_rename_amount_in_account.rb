# frozen_string_literal: true

class RenameAmountInAccount < ActiveRecord::Migration[5.2]
  def change
    rename_column :accounts, :amount, :balance
  end
end
