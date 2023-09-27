class RouteFacade

  def self.get_route(origin, destination)
    json = MapQuestService.get_directions(origin, destination)
    result = json[:route][:formattedTime]
    Route.new(result, origin, destination)
  end
end