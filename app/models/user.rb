class User < ApplicationRecord

  validates :email, presence: { message: "Can't be blank" }
  validates_uniqueness_of :email

  has_secure_password
  
  def self.user_params_valid?(user_params)
    if user_params[:password] != user_params[:password_confirmation]
      raise ActiveRecord::StatementInvalid, "Passwords do not match"
    else
      true
    end
  end

  def self.correct_info?(user_params)
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      true
    else
      raise ActiveRecord::StatementInvalid, "Email or Password is Invaild"
    end
  end
end