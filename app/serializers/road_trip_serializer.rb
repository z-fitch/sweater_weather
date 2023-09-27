class RoadTripSerializer

  def self.create_roadtrip(route, weather)
    {
      "data": {
          "id": "null",
          "type": "road_trip",
          "attributes": {
              "start_city": route.start_city,
              "end_city": route.end_city,
              "travel_time": route.travel_time,
              "weather_at_eta": if route.travel_time != "Impossible"
              {
                  "datetime": route.date_time,
                  "temperature": weather.temperature,
                  "condition": weather.condition
              }
            else 
              ""
            end
          }
      }
    }
  end
end