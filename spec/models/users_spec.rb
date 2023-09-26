require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email).with_message("Can't be blank")}
    it { should validate_presence_of(:password)}
    it { should validate_uniqueness_of(:email)}
  
  end

  describe 'class methods' do
    describe '.user_params_valid?' do
      it 'checks if passwords are the same' do 
        user_params = {
          password: 'password',
          password_confirmation: 'password'
        }

        expect(User.user_params_valid?(user_params)).to eq(true)
      end
    end

    describe '.correct_info?' do
      it 'checks if email exists and password is correct' do 

        create_account = { 
          email: 'email@gmail.com',
          password: 'password',
          password_confirmation: 'password'
        }

        User.create!(create_account)

        user_params = {
          email: 'email@gmail.com',
          password: 'password',
        }

        expect(User.correct_info?(user_params)).to eq(true)
      end
    end
  end
end