require 'rails_helper'

RSpec.describe 'Map Service Spec' do
  before :each do
    WebMock.allow_net_connect!
    VCR.turn_off!
    # VCR.turn_on!
  end

  it 'can list breweries in a location with proper attributes' do
    actual = BreweriesFacade.list_of_breweries_by_location('bend,or')

    expect(actual.class).to eq(Array)
    expect(actual[0].class).to eq(BreweriesPoro)
    expect(actual[0].brewery_type.present?).to eq(true)
    expect(actual[0].name.present?).to eq(true)
    expect(actual[0].id.present?).to eq(true)
  end

  xit 'can list breweries in a location without unneeded attributes' do
    actual = BreweriesFacade.list_of_breweries_by_location('bend,or')

    expect(actual[0].obdb_id.present?).to_not eq(true)
  end
end
