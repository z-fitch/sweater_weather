require 'rails_helper'

RSpec.describe OpenLibraryService do
  describe 'Class Methods' do
    context '.get_books', :vcr do
      it 'returns lists of books after getting a city' do
        books = OpenLibraryService.get_books('denver,co', 5)
        
        expect(books).to be_a(Hash)
        expect(books[:num_found]).to be_an(Integer)

        expect(books).to be_a(Hash)
        expect(books[:docs]).to be_an(Array)

        expect(books[:docs]).to be_an(Array)

        expect(books).to have_key(:num_found)
        expect(books[:docs].first).to have_key(:title)
        expect(books[:docs].first).to have_key(:isbn)
      end
    end    
  end
end