require 'rails_helper'

RSpec.describe BooksFacade do
  describe 'Class Methods', :vcr do
    context ".book_results" do 
      it 'return book objects' do
        facade = BooksFacade.book_results('denver,co', 2)

        expect(facade).to be_an(Array) 
        expect(facade.count).to eq(2) 
      end
    end

    context ".book_count" do 
      it 'return book count' do
        facade = BooksFacade.book_count('denver,co', 2)

        expect(facade).to eq(772) 
      end
    end
  end
end