# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def create
    user = User.new(user_params)
    puts user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
