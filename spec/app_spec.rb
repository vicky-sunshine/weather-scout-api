require_relative 'spec_helper'
require 'json'

describe 'Getting the root of the service' do
  it 'Should return ok' do
    get '/'
    last_response.must_be :ok?
    last_response.body.must_match(/Hello, This is Weather Scout service./i)
  end
end

describe 'Look up the weather today' do
  it 'Should return ok' do
    header = { 'CONTENT_TYPE' => 'application/json' }
    body = {
      city: '新竹'
    }

    post '/api/v1/daily_weather', body.to_json, header
    last_response.must_be :ok?
  end

  it 'Should return 404 for unknown city (not major city)' do
    header = { 'CONTENT_TYPE' => 'application/json' }
    body = {
      city: '台東市'
    }

    post '/api/v1/daily_weather', body.to_json, header
    last_response.must_be :not_found?
  end

  it 'Should return 400 for bad json format' do
    header = { 'CONTENT_TYPE' => 'application/json' }
    body = "blah blah"

    post '/api/v1/daily_weather', body.to_json, header
    last_response.must_be :bad_request?
  end
end
