require 'rails_helper'

RSpec.describe Location do
  it 'exists' do
    attributes = {
      lat: '1231232',
      lng: '12312312'
    }

    location = Location.new(attributes)

    expect(location).to be_a(Location)
    expect(location.lat).to eq('1231232')
    expect(location.lon).to eq('12312312')
  end
end
