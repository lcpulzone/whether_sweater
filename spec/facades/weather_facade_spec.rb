require 'rails_helper'

RSpec.describe 'Weather Facade' do
  before :each do
    WebMock.allow_net_connect!
    VCR.turn_off!
    # VCR.turn_on!
  end

  describe 'current, daily, hourly'
  it 'can give the current weather' do
    # VCR.use_cassette 'facade_bend_current_weather' do
      actual = WeatherFacade.current_daily_hourly_weather(44.058088, -121.31515)
      require "pry";binding.pry
      expect(actual.class).to eq(ForecastPoro)
      expect(actual.datetime).to eq("August 08, 09:05 AM -0700")
      expect(actual.sunset).to eq("August 08, 08:20 PM -0700")
      expect(actual.temperature).to eq(58.77)
      expect(actual.feels_like).to eq(57.07)
      expect(actual.conditions).to eq("clear sky")
      # expect(actual.pressure.present?).to eq(true)
    # end
  end
end
