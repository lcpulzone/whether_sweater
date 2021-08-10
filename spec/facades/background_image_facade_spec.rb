require 'rails_helper'

RSpec.describe 'Weather Facade' do
  before :each do
    # WebMock.allow_net_connect!
    # VCR.turn_off!
    VCR.turn_on!
  end

  it 'can get the image attributes' do
    VCR.use_cassette 'facade_background_image' do
      actual = BackgroundImageFacade.background_image_info('bend,oregon')

      expect(actual.class).to eq(BackgroundImagePoro)
    end
  end
end
