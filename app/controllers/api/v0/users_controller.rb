class Api::V0::UsersController < ApplicationController


  def create
    begin
      if User.user_params_valid?(params)
        render json: UserSerializer.new(User.create!(email: user_params[:email], password: user_params[:password], api_key: api_key_gen)), status: 201
      end
    rescue ActiveRecord::RecordInvalid => e
      render json: ErrorSerializer.format_errors(e.message), status: 409
    rescue ActiveRecord::StatementInvalid => e
      render json: ErrorSerializer.format_errors(e.message), status: 404
    end
  end

  private

  def user_params
    params.permit(:email, :password, :api_key)
  end
  
  def api_key_gen
    SecureRandom.hex(25)
  end

end