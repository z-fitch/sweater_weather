class RoadTrip < ApplicationRecord
  
  def self.correct_key?(user_params)
    user = User.find_by(api_key: user_params[:api_key])
    if user
      true
    else
      raise ActiveRecord::StatementInvalid, "Key not Authorized"
    end
  end
end