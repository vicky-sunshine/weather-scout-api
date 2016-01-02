require_relative 'spec_helper'
require 'json'

describe 'Getting the root of the service' do
  it 'Should return ok' do
    get '/'
    last_response.must_be :ok?
    last_response.body.must_match(/Weatherscout service/i)
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
end
