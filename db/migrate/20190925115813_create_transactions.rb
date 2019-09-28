# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.integer :sender_account_id
      t.integer :receiver_account_id

      t.timestamps
    end
  end
end
