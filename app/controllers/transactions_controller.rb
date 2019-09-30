# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :exist, only: %i[verify_transaction]

  def index
    transactions = Transaction.all
    render json: { transactions: transactions }, status: :ok
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.save!
    render json: { transaction: @transaction }, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def verify_transaction
    render json: { transaction: @transaction }, status: :ok
  end

  private

  def exist
    @transaction = Transaction.find_by(transaction_number_param)
    render json: { error: 'Transaction is not available' }, status: :not_found unless @transaction.present?
  end

  def transaction_params
    params.require(:transaction).permit(:sender_account_number, :receiver_account_number, :amount)
  end

  def transaction_number_param
    params.require(:transaction).permit(:transaction_number)
  end
end
