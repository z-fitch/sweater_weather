class Route
  attr_reader :travel_time, :start_city, :end_city, :hour, :date_time

  def initialize(time, origin, destination)
    @travel_time = possible_dest?(time)
    @date_time = format_datetime(time)
    @hour = format_hour(time)
    @start_city = origin
    @end_city = destination
  end

  def format_datetime(time)
    x = Time.now + time.to_i.hours
    x.to_s.slice(0..15)
  end

  def format_hour(time)
    x = Time.now + time.to_i.hours
    x.to_s.split[1].slice(0..4).to_i
  end

  def possible_dest?(time)
    if time == nil
      "Impossible"
    else
      time
    end
  end
end