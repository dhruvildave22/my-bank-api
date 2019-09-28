# frozen_string_literal: true

class AddSenderAndReceiverNumberColumnToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :sender_account_number, :string
    add_column :transactions, :receiver_account_number, :string
  end
end
