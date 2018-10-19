require "rails_helper"
# require 'fakerbot'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe 'uniqueness' do
    before :each do
      create :user
    end

    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
  end

  describe 'User::find_by_credentials' do
    let(:user) {create :user}

    it 'finds a user given username and password' do

      expect(User.find_by_credentials(user.username, user.password).attributes).to eq(user.attributes)
    end
  end

  describe '#is_password?' do
    let(:user) { create :user }

    context 'with valid password' do
      it 'should return true' do
        expect(user.is_password?('starwars')).to be true
      end
    end

    context 'with invalid password' do
      it 'should return false' do
        expect(user.is_password?('startrek')).to be false
      end
    end
  end
end
