require 'rails_helper'

RSpec.describe Room, type: :model do
  let!(:user) { create :user }
  let!(:room) { build(:room, host_id: user.id) }

  it { should belong_to(:host) }
  it { should have_db_index(:host_id) }
  it { should validate_presence_of(:host_id) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:fee) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
end
