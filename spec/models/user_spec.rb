require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create :user }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_length_of(:username).is_at_least(3) }
  it { should validate_length_of(:username).is_at_most(10) }
  it { should have_many(:rooms).dependent(:destroy) }

  it "is expected to generate it's own jwt token" do
    expect(user.generate_token).not_to be_nil
  end
end
