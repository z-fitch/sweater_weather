require 'rails_helper'

RSpec.describe Book do
  it 'exists' do
    attributes = {
      isbn: ['0762507845'],
      title: 'Spot'
    }

    book = BookObject.new(attributes)
  
    expect(book).to be_a(BookObject)
    expect(book.isbn).to eq(['0762507845'])
    expect(book.title).to eq('Spot')
  end
end