# frozen_string_literal: true

class User < ApplicationRecord
  has_one :account
  validates :email, presence: true
  validates :email, uniqueness: true
end
