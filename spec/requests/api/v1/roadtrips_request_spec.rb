require 'rails_helper'

RSpec.describe 'Roadtrip Resquest' do
  before :each do
    WebMock.allow_net_connect!
    VCR.turn_off!
    # VCR.turn_on!
  end

  describe 'Happy Path' do
    it 'can give a valid response' do
      @user = User.create!(email: "hawkthedog@pets.com", password: "helovesfood",
                          password_confirmation: "helovesfood", api_key: "123456789")
      headers = {
        'Content-Type': "application/json",
        'Accept': "application/json"
      }

      body = {
        "origin": "Denver,CO",
        "destination": "Bend,OR",
        "api_key": "123456789"
      }

      post api_v1_road_trip_path, headers: headers, params: body.to_json

      roadtrip = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(roadtrip[:data].count).to eq(3)
      expect(roadtrip[:data][:attributes].count).to eq(4)
      expect(roadtrip[:data][:attributes]).to have_key(:start_city)
      expect(roadtrip[:data][:attributes]).to have_key(:end_city)
      expect(roadtrip[:data][:attributes]).to have_key(:travel_time)
      expect(roadtrip[:data][:attributes]).to have_key(:weather_at_eta)
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
