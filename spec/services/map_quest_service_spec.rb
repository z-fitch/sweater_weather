require 'rails_helper'

RSpec.describe MapQuestService do
  describe 'Class Methods' do
    context '.location_format', :vcr do
      it 'returns geolocation information after getting an address' do
        location = MapQuestService.location_format('denver,co')
        
        expect(location).to be_a(Hash)
        expect(location[:results]).to be_an(Array)
      end

      it 'has the needed location Data' do
        location = MapQuestService.location_format('denver,co')
        location_data = location[:results].first[:locations].first

        expect(location_data).to have_key(:latLng)
        expect(location_data[:latLng]).to be_a(Hash)

        expect(location_data[:latLng]).to have_key(:lat)
        expect(location_data[:latLng][:lat]).to be_a(Float)

        expect(location_data[:latLng]).to have_key(:lng)
        expect(location_data[:latLng][:lng]).to be_a(Float)
      end
    end    

    context '.get_directions', :vcr do
      it 'gets directions from an origin to a dest.' do
        route_data = MapQuestService.get_directions('denver,co', 'san antonio,tx')

        expect(route_data).to be_a(Hash)

        expect(route_data[:route]).to have_key(:formattedTime)
        expect(route_data[:route][:formattedTime]).to be_a(String)
      end
    end    
  end
end
