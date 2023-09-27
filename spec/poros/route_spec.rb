require 'rails_helper'

RSpec.describe Route do
  before :each do 
    @time = '3:54:00'
    @origin = 'San Antonio'
    @destination = "Dallas"

    @now = Time.parse("2023-01-01 00:00:00")
    allow(Time).to receive(:now) { @now }

    @route = Route.new(@time, @origin, @destination)
  end
  it 'exists' do
    expect(@route).to be_a(Route)
    expect(@route.travel_time).to eq("3:54:00")
    expect(@route.date_time).to eq("2023-01-01 03:00")
    expect(@route.hour).to eq(3)
    expect(@route.start_city).to eq("San Antonio")
    expect(@route.end_city).to eq('Dallas')
  end

  context 'format_datetime(time)' do 
    it 'give date with hours' do 
    expect(@route.format_datetime('3:54:00')).to eq("2023-01-01 03:00")
    end
  end

  context 'format_hour(time)' do 
    it 'takes travel time and makes in a integer' do 
      expect(@route.format_hour('3:54:00')).to eq(3)
    end
  end

  context 'possible_dest?(time)' do 
    it 'returns either the time or impossible depending on the API repsonse for time' do 
      expect(@route.possible_dest?('3:54:00')).to eq('3:54:00')
      expect(@route.possible_dest?(nil)).to eq("Impossible")
    end
  end
end