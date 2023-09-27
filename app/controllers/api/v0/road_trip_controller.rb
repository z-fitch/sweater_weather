class Api::V0::RoadTripController < ApplicationController

  def create
    begin
      if RoadTrip.correct_key?(params)
        route = RouteFacade.get_route(params[:origin], params[:destination])
        arrival_weather = ForecastFacade.specific_hour(MapFacade.get_location(params[:destination]), route.hour)
        render json: RoadTripSerializer.create_roadtrip(route, arrival_weather)
      end
    rescue ActiveRecord::StatementInvalid => e
      render json: ErrorSerializer.format_errors(e.message), status: 401
    end
  end
end