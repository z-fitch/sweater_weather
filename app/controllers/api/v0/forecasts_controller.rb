class Api::V0::ForecastsController < ApplicationController
  def index
    begin
      @location = MapFacade.get_location(Forecast.location_present(params[:location]))
      @current = ForecastFacade.current_weather_forecast(@location)
      @daily = ForecastFacade.daily_weather_forecast(@location)
      @hourly = ForecastFacade.hourly_weather_forecast(@location)
      render json: ForecastSerializer.weather_data(@current, @daily, @hourly)
    rescue StandardError => e
      render json: ErrorSerializer.format_errors(e.message), status: 404
    end
  end

  
end