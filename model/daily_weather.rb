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
  attr_reader :city, :date, :temperature_day, :temperature_night,
              :condition_day, :condition_night, :rain_probability, :tips
  def initialize(city)
    @weather = DailyWeatherScraper::DailyWeather.new(city)
    @city = @weather.city
    @date = @weather.date
    @temperature_day = @weather.temperature_day
    @temperature_night = @weather.temperature_night
    @condition_day = @weather.condition_day
    @condition_night = @weather.condition_night
    @rain_probability = @weather.rain_probability
    @tips = @weather.tips
  end

  def to_json
    {'city' => @city,
     'date' => @date,
     'temperature_day' => @temperature_day,
     'temperature_night' => @temperature_night,
     'condition_day' => @condition_day,
     'condition_night' => @condition_night,
     'rain_probability' => @rain_probability,
     'tips' => @tips}.to_json
  end

  private

end
