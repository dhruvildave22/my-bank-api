# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :exist, only: %i[verify_account]
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
    render json: { account: @account }, status: :ok
  end

  private

  def exist
    @account = Account.find_by(number: params[:number])
    render json: { error: 'Account is not available' }, status: :not_found unless @account.present?
  end

  def account_params
    params.require(:account).permit(:balance, :user_id)
  end
end
