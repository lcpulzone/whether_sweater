require 'rails_helper'

RSpec.describe 'Map Service Spec' do
  before :each do
    WebMock.allow_net_connect!
    VCR.turn_off!
    # VCR.turn_on!
  end

  it 'can list breweries in a location' do
    actual = BreweriesFacade.list_of_breweries_by_location(location)

    expect(actual.class).to eq(BreweriesPoro)
  end
end
