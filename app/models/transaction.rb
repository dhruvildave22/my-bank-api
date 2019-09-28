# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :sender_account, class_name: 'Account', optional: true
  belongs_to :receiver_account, class_name: 'Account', optional: true

  validates :amount, numericality: true
  validates :receiver_account_id, presence: true
  before_validation :set_default, :set_default_transaction_number
  after_create :update_balance

  def update_balance
    ActiveRecord::Base.transaction do
      sender_account.withdraw(amount)
      receiver_account.deposit(amount)
    end
  end

  def set_default
    self.sender_account_id = Account.find_by(number: sender_account_number).id
    self.receiver_account_id = Account.find_by(number: receiver_account_number).id
  end

  def set_default_transaction_number
    self.transaction_number ||= SecureRandom.hex(8)
  end
end
