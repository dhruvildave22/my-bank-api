# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    users = User.all
    render json: { users: users }, status: :ok
  end

  def create
    user = User.new(user_params)
    user.save!
    render json: { user: user }, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
