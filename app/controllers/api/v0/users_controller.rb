class Api::V0::UsersController < ApplicationController


  def create
    begin
      if User.user_params_valid?(params)
        render json: UserSerializer.new(User.create!(user_params)), status: 201
      end
    rescue ActiveRecord::RecordInvalid => e
      render json: ErrorSerializer.format_errors(e.message), status: 409
    rescue ActiveRecord::StatementInvalid => e
      render json: ErrorSerializer.format_errors(e.message), status: 404
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end