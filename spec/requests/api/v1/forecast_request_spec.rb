require 'rails_helper'

RSpec.describe 'Forecast Controller' do
  before :each do
    # WebMock.allow_net_connect!
    # VCR.turn_off!
    VCR.turn_on!
  end

  describe 'forecast details' do
    it 'can give a json response for a given location' do
      VCR.use_cassette 'forecast_request_bend_or_response' do
        get '/api/v1/forecast?location=bend,or'

        forecast_details = JSON.parse(response.body, symbolize_names: true)

        expect(forecast_details[:data].size).to eq(3)
        expect(forecast_details[:data][:id]).to eq(nil)
        expect(forecast_details[:data][:type]).to eq("forecast")
        expect(forecast_details[:data][:attributes].size).to eq(3)
      end
    end

    it 'can give the current weather in a json response' do
      VCR.use_cassette 'forecast_request_bend_or_response' do
        get '/api/v1/forecast?location=bend,or'

        forecast_details = JSON.parse(response.body, symbolize_names: true)

        expect(forecast_details[:data][:attributes][:current_weather].size).to eq(10)
        expect(forecast_details[:data][:attributes][:current_weather][:datetime].class).to eq(String)
        expect(forecast_details[:data][:attributes][:current_weather][:temperature].class).to eq(Float)
      end
    end

    it 'current weather does not have these attributes in the json response' do
      VCR.use_cassette 'forecast_request_bend_or_response' do
        get '/api/v1/forecast?location=bend,or'

        forecast_details = JSON.parse(response.body, symbolize_names: true)

        expect(forecast_details[:data][:attributes][:current_weather][:pressure].nil?).to eq(true)
        expect(forecast_details[:data][:attributes][:current_weather][:dew_point].nil?).to eq(true)
      end
    end
  end
end
