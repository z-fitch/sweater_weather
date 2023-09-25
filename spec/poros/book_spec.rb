require 'rails_helper'

RSpec.describe Books do
  it 'exists' do
    attributes = {
      isbn: ['0762507845'],
      title: spot
    }

    book = Book.new(attributes)
  
    expect(book).to be_a(Book)
    expect(book.isbn).to eq(['0762507845'])
    expect(book.title).to eq(['Spot'])
  end
end