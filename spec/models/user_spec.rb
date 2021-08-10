require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:api_key) }
    it { should validate_uniqueness_of(:email) }
  end
end
