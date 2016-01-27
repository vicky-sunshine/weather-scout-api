require 'weatherscout'
require 'json'

##
# Loads and returns full weather info with scraper gem
#
# Example:
#   weather = DailyWeather.new('新竹')
#   puts weather.to_json
#
class WeeklyWeather
  attr_reader :city, :weathers
  def initialize(city)
    weekly_weather = WeatherScraper::WeeklyWeather.new(city)
    @city = weekly_weather.city
    @weathers = weekly_weather.weathers
  end

  def to_json
    {'city' => @city,
     'weathers' => @weathers}.to_json
  end

  private

end
