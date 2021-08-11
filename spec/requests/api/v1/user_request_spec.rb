require 'rails_helper'

RSpec.describe 'User Resquest' do
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
        'email': 'hawkthedog@pets.com',
        'password': 'helovesfood',
        'password_confirmation': 'helovesfood'
      }

      post api_v1_users_path, headers: headers, params: body.to_json

      user = JSON.parse(response.body, symbolize_names: true)

      # expect(response.status).to eq(200)
    end
  end

  describe 'Sad Path' do
    it 'can give an invalid response' do
      @user = User.create!(email: "hawkthedog@pets.com", password: "helovesfood",
                          password_confirmation: "helovesfood", api_key: "123456789")
      headers =
      {
        'Content-Type': "application/json",
        'Accept': "application/json"
      }

      body =
      {
        'email': 'hawkthedog@pets.com',
        'password': nil,
        'password_confirmation': 'helovesfood'
      }

      post api_v1_users_path, headers: headers, params: body.to_json


    end
  end
end
