require_relative './model/daily_weather'
require_relative './model/weekly_weather'

##
# Helpers for main Sinatra web application
module WeatherHelpers
  def get_daily_weather(city)
    DailyWeather.new(city)
  rescue
    halt 404
  end

  def get_weekly_weather(city)
    WeeklyWeather.new(city)
  rescue
    halt 404
  end
end
