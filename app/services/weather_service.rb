class WeatherService

  def self.get_forecast(location)
    get_url("forecast.json?q=#{location.lat}+#{location.lon}&days=5")
  end

  def self.get_one_forecast(location, hour)
    get_url("forecast.json?q=#{location.lat}+#{location.lon}&hour=#{hour}")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "http://api.weatherapi.com/v1/") do |faraday|
      faraday.headers["key"] = Rails.application.credentials.weather[:api_key]
    end
  end
end