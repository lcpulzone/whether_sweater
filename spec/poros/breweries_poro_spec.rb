require 'rails_helper'

RSpec.describe 'Breweries Poro' do
  before :each do
    WebMock.allow_net_connect!
    VCR.turn_off!
    # VCR.turn_on!
  end

  it 'can return brewery attributes' do
    # expect()
  end
end
