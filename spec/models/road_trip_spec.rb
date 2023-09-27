require 'rails_helper'

RSpec.describe Forecast, type: :model do

  describe 'class methods' do
    describe 'correct_key?' do 
      it 'will return true is a user with teh api key exists' do 
        create_account = { 
          email: 'email@gmail.com',
          password: 'password',
          password_confirmation: 'password'
        }

        user =  User.create!(create_account)
    
        params = { 
          "origin": "Cincinatti,OH",
          "destination": "Chicago,IL",
          "api_key": user.api_key
        }
        
        expect( RoadTrip.correct_key?(params) ).to eq(true)
      end

      it 'will raise an error if no user with that key exists' do 
        create_account = { 
          email: 'email@gmail.com',
          password: 'password',
          password_confirmation: 'password'
        }

        User.create!(create_account)
    
        params = { 
          "origin": "Cincinatti,OH",
          "destination": "Chicago,IL",
          "api_key": "lollll"
        }
        
        expect { RoadTrip.correct_key?(params) }.to raise_error( ActiveRecord::StatementInvalid)
      end
    end
  end
end