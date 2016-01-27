require 'sinatra/base'
require_relative 'weather_helper'

##
# Simple web service to delver codebadges functionality
class WeatherScoutApp < Sinatra::Base
  helpers WeatherHelpers

  configure :production, :development do
      enable :logging
  end

  get_root = lambda do
    'Hello, This is Weather Scout service. Current API version is v1. See Homepage ' \
      '<a href="https://github.com/vicky-sunshine/weather-scout-api">' \
      'Github repo</a>'
  end

  post_daily_weather = lambda do
    content_type :json
    begin
      req = JSON.parse(request.body.read)
    rescue
      halt 400
    end
    get_daily_weather(req['city']).to_json
  end

  post_weekly_weather = lambda do
    content_type :json
    begin
      req = JSON.parse(request.body.read)
    rescue
      halt 400
    end
    get_weekly_weather(req['city']).to_json
  end

  get '/', &get_root
  post '/api/v1/daily_weather', &post_daily_weather
  post '/api/v1/weekly_weather', &post_weekly_weather
end
