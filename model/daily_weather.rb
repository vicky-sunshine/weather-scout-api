require 'weatherscout'
require 'json'

##
# Loads and returns full weather info with scraper gem
#
# Example:
#   weather = DailyWeather.new('新竹')
#   puts weather.to_json
#
class DailyWeather
  attr_reader :city, :weathers, :tips
  def initialize(city)
    daily_weather = WeatherScraper::DailyWeather.new(city)
    @city = daily_weather.city
    @weathers = daily_weather.weathers
    @tips = daily_weather.tips
  end

  def to_json
    {'city' => @city,
     'weathers' => @weathers,
     'tips' => @tips}.to_json
  end

  private

end
