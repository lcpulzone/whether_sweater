require 'rails_helper'

RSpec.describe 'Forecast Controller' do
  before :each do
    WebMock.allow_net_connect!
    VCR.turn_off!
    # VCR.turn_on!
  end

  describe 'forecast details' do
    it 'can give the current, daily, and hourly weather' do
      # VCR.use_cassette 'forecast_poro' do
      get api_v1_forecast_path(location:'bend,or')

      response = JSON.parse(response.body, symbolize_names: true)
      require "pry";binding.pry
      expect(response).to be_successful
      # end
    end
  end
end
