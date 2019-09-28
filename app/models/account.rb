# frozen_string_literal: true

class Account < ApplicationRecord
  has_one :user
  has_many :transactions
  validates :number, presence: true
  before_validation :set_default

  def withdraw(amount)
    update(balance: balance - amount)  
  end

  def deposit(amount)
    update(balance: balance + amount)
  end

  def set_default
    self.number ||= SecureRandom.hex(8)
  end
end
