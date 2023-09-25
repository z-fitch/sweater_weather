require 'rails_helper'

RSpec.describe Current do
  it 'exists' do
    attributes = {
      last_updated: '10-10-2023',
      temp_f: 99.9,
      feelslike_f: 98.9,
      humidity: 99.9,
      uv: 98.9,
      vis_miles: 99.9,
      condition: {
        text: 'sunny',
        icon: 'someicon.png'
      }
    }

    current_weather = Current.new(attributes)
  
    expect(current_weather).to be_a(Current)
    expect(current_weather.last_updated).to eq('10-10-2023')
    expect(current_weather.temperature).to eq(99.9)
    expect(current_weather.feels_like).to eq(98.9)
    expect(current_weather.humidity).to eq(99.9)
    expect(current_weather.uvi).to eq(98.9)
    expect(current_weather.visibility).to eq(99.9)
    expect(current_weather.condition).to eq('sunny')
    expect(current_weather.icon).to eq('someicon.png')
  end
end