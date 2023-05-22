require "rails_helper"
RSpec.describe User, type: :model do
# RSpec.describe User do
  let!(:user) {create(:user)}
  describe "associations" do
    it { should have_many(:parcels) }
    it { should have_many(:trains) }
  end

  describe "enums" do
    it { should define_enum_for(:role).with_values(parcel_owner: 0, train_operator: 1, post_master: 2) }
  end

  it 'creates a user' do
    user = create(:user)
    expect(user).to be_valid
    expect(user.role).to eq('parcel_owner')
  end

  it 'creates a train operator' do
    user = create(:user, :train_operator)
    expect(user).to be_valid
    expect(user.role).to eq('train_operator')
  end

  it 'creates a post master' do
    user = create(:user, :post_master)
    expect(user).to be_valid
    expect(user.role).to eq('post_master')
  end
end
