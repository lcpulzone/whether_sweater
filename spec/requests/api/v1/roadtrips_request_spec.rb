require 'rails_helper'

RSpec.describe 'Roadtrip Resquest' do
  before :each do
    WebMock.allow_net_connect!
    VCR.turn_off!
    # VCR.turn_on!
  end

  describe 'Happy Path' do
    xit 'can give a valid response' do
      user_info = {
        'email': 'hawkthedog@pets.com',
        'password': 'helovesfood'
      }

      post api_v1_road_trip_path, params: user_info


    end
  end

  describe 'Sad Path' do
    xit 'can give an invalid response' do
      user_info = {
        'email': 'hawkthedog@pets.com',
        'password': nil
      }

      post api_v1_road_trip_path, params: user_info


    end
  end
end
