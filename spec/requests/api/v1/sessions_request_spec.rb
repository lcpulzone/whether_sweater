require 'rails_helper'

RSpec.describe 'Sessions Resquest' do
  before :each do
    WebMock.allow_net_connect!
    VCR.turn_off!
    # VCR.turn_on!
  end

  describe 'Happy Path' do
    it 'can give a valid response' do
      user_info = {
        'email': 'hawkthedog@pets.com',
        'password': 'helovesfood'
      }

      post api_v1_sessions_path, params: user_info


    end
  end

  describe 'Sad Path' do
    it 'can give an invalid response' do
      user_info = {
        'email': 'hawkthedog@pets.com',
        'password': nil
      }

      post api_v1_sessions_path, params: user_info


    end
  end
end
