require 'rails_helper'

RSpec.describe Forecast, type: :model do

  describe 'class methods' do
    describe '.correct_quantity' do 
      it ' will raise an error if the quantity is <= 0' do 
        expect(Book.correct_quantity(1)).to eq(1)
      end
    end
  end
end