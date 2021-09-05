require 'rails_helper'

RSpec.describe 'User Resquest' do
  before :each do
    WebMock.allow_net_connect!
    VCR.turn_off!
    # VCR.turn_on!
    @headers = {
      'Content-Type': "application/json",
      'Accept': "application/json"
    }

    @body = {
      'email': 'hawkthedog@pets.com',
      'password': 'helovesfood',
      'password_confirmation': 'helovesfood'
    }
  end

  describe 'Happy Path' do
    it 'can create a new user' do
      post api_v1_users_path, headers: @headers, params: @body.to_json

      new_user = JSON.parse(response.body, symbolize_names: true)

      expect(new_user[:data].size).to eq(3)
    end

    it 'can give a valid status when creating a new user' do
      post api_v1_users_path, headers: @headers, params: @body.to_json

      new_user = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
    end
  end

  describe 'Sad Path' do
    it 'can give a bad request response for an invalid entry' do
      body =
      {
        'email': 'hawkthedog@pets.com',
        'password': nil,
        'password_confirmation': 'helovesfood'
      }

      post api_v1_users_path, headers: @headers, params: body.to_json
      new_user = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
    end

    it 'can give an invalid response when a new user cannot be created' do
      body =
      {
        'email': 'hawkthedog@pets.com',
        'password': nil,
        'password_confirmation': 'helovesfood'
      }

      post api_v1_users_path, headers: @headers, params: body.to_json
      new_user = JSON.parse(response.body, symbolize_names: true)

      expect(new_user[:error]).to eq("Email and/or Password are incorrect and/or missing, please try again")
    end
  end
end
