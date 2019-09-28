# frozen_string_literal: true

class AddTransactionNumberToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :transaction_number, :string
  end
end
