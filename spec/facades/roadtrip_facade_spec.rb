require 'rails_helper'

RSpec.describe 'Roadtrip Facade' do
  before :each do
    # WebMock.allow_net_connect!
    # VCR.turn_off!
    VCR.turn_on!
  end

  it 'can get the roadtrip attributes' do
    VCR.use_cassette 'facade_roadtrip_less_than_2_days_data' do
      actual = RoadtripFacade.roadtrip_info('denver,co', 'bend,or')

      expect(actual.class).to eq(RoadtripPoro)
      # @end_city="bend,or",
      # @start_city="denver,co",
      # @travel_time="16:13:11",
      # @weather_at_eta=
      # {
      #   :temperature=>86.18,
      #   :conditions=>"clear sky"
      # }
    end
  end

  it 'can get the roadtrip attributes when the trip is longer than 48 hours' do
    VCR.use_cassette 'facade_roadtrip_more_than_2_days_data' do
      actual = RoadtripFacade.roadtrip_info('anchorage,ak', 'irvine,ca')

      expect(actual.class).to eq(RoadtripPoro)
      # @end_city="irvine,ca",
      # @start_city="anchorage,ak",
      # @travel_time="58:13:32",
      # @weather_at_eta=
      # {
      #   :temperature=>78.91,
      #   :conditions=>"clear sky"
      # }
    end
  end
end
