class Api::V0::UsersController < ApplicationController


  def create
    begin
      # require 'pry'; binding.pry
      render json: UserSerializer.new(User.create!(user_params)), status: 201
    rescue ActiveRecord::RecordInvalid => error
      render json: ErrorSerializer.new(error).format_errors, status: :bad_request
    end
  end


  private

  def user_params
    params.permit(:email, :password)
  end
end