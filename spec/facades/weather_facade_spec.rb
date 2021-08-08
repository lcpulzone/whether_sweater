require 'rails_helper'

RSpec.describe 'Weather Facade' do
  before :each do
    WebMock.allow_net_connect!
    VCR.turn_off!
    # VCR.turn_on!
  end

  describe 'current, daily, hourly'
  it 'can give the current weather' do
    # VCR.use_cassette 'bend_current_weather' do
      actual = WeatherFacade.current_daily_hourly_weather(44.058088, -121.31515)
    # end

    expect(actual)
  end
end
