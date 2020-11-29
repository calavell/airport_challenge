require './lib/plane.rb'

class Airport

  attr_accessor :hangar, :capacity, :weather

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = weather_generator
  end

  def land_plane(plane)
    fail 'too stormy' if stormy?

    fail 'hangar full' unless capacity?

    @hangar << plane
    plane.current_location = 'landed'
    reset_airport_weather
  end

  def take_off(plane)
    fail 'too stormy' if stormy?

    fail 'plane not located here' unless plane_present?(plane)

    @hangar.delete(plane)
    plane.current_location = 'flying'
    reset_airport_weather
  end

  def plane_present?(plane)
    @hangar.include?(plane)
  end

  def capacity?
    @hangar.count < @capacity
  end

  def weather_generator
    ['sunny', 'stormy', 'cloudy', 'rainy', 'windy'].sample
  end

  def stormy?
    @weather == 'stormy'
  end

  def reset_airport_weather
    @weather = weather_generator
  end

end
