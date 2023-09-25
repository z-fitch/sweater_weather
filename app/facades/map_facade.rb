class MapFacade


  def self.get_location(location)
    json = MapQuestService.location_format(location)
    results = json[:results].first[:locations].first[:latLng]
    Location.new(results)
  end
end