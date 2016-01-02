require 'sinatra/base'
require_relative './model/daily_weather'

##
# Simple web service to delver codebadges functionality
class WeatherScoutApp < Sinatra::Base
  helpers do
    def get_daily_weather(city)
      DailyWeather.new(city)
    rescue
      halt 404
    end
  end

  get '/' do
    'Weatherscout service is up and working. See documentation at its ' \
      '<a href="https://github.com/vicky-sunshine/weather-scout-api">' \
      'Github repo</a>'
  end

  post '/api/v1/daily_weather' do
    content_type :json
    begin
      req = JSON.parse(request.body.read)
    rescue
      halt 400
    end
    get_daily_weather(req['city']).to_json
  end

end
