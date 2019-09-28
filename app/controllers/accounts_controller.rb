# frozen_string_literal: true

class AccountsController < ApplicationController
  def index
    accounts = Account.all
    render json: { accounts: accounts }, status: :ok
  end

  def create
    account = Account.new(account_params)
    account.save!
    respond_to do |format|
      format.json { render json: { account: account }, status: :ok }
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def verify_account
    account = Account.find_by(account_number_param)
    render json: { account: account }, status: :ok
  end

  private

  def account_number_param
    params.require(:account).permit(:number)
  end

  def account_params
    params.require(:account).permit(:balance, :user_id)
  end
end
