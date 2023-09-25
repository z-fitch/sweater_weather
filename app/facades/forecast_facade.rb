class ForecastFacade


  def self.current_weather_forecast(location)
    json = WeatherService.get_forecast(location)
    Current.new(json[:current])
  end
  
  def self.daily_weather_forecast(location)
    json = WeatherService.get_forecast(location)
    json[:forecast][:forecastday].map do |data|
      Daily.new(data)
    end
  end

  def self.hourly_weather_forecast(location)
    json = WeatherService.get_forecast(location)
    day = json[:forecast][:forecastday].map do |data|
      data[:hour].map do |h|
        Hourly.new(h)
      end
    end
    day.first
  end

  # private

  # def weather_data(location)
  #   @_weather_data ||= WeatherService.get_forecast(location)
  # end
  
end