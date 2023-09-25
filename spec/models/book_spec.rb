require 'rails_helper'

RSpec.describe Forecast, type: :model do

  describe 'class methods' do
    describe '.correct_quantity' do 
      it ' will pass if quantity is greater than 0' do 
        expect(Book.correct_quantity(1)).to eq(1)
      end
    end
  end
end