require_relative './model/daily_weather'

##
# Helpers for main Sinatra web application
module WeatherHelpers
  def get_daily_weather(city)
    DailyWeather.new(city)
  rescue
    halt 404
  end
end
