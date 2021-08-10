require 'rails_helper'

RSpec.describe 'Background Image' do
  before :each do
    WebMock.allow_net_connect!
    VCR.turn_off!
    # VCR.turn_on!
  end

  it 'can render a json image' do
    get '/api/v1/backgrounds?location=bend,oregon'

    image_info = JSON.parse(response.body, symbolize_names: true)

    expect(image_info.class).to eq(Hash)
  end
end
