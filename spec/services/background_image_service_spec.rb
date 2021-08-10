require 'rails_helper'

RSpec.describe 'Background Image Service' do
  before :each do
    # WebMock.allow_net_connect!
    # VCR.turn_off!
    VCR.turn_on!
  end

  it 'can get a background Image for a location' do
    VCR.use_cassette 'bend_background_image' do
      actual = BackgroundImageService.find_location_image('bend,oregon')

      expect(actual.class).to eq(Hash)
      expect(actual[:results][0][:urls].class).to eq(Hash) #image_url
      expect(actual[:results][0][:user][:name]).to eq("everett mcintire") #author
  
    end
  end
end
