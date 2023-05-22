require 'rails_helper'

RSpec.describe Train, type: :model do
  describe "associations" do
    it { should have_many(:parcels) }
    it { should have_many(:train_lines) }
    it { should have_many(:lines).through(:train_lines) }
  end

  describe "custom validation" do
    let(:train) { Train.new }

    context "when the user role is not 'train_operator'" do
      before do
        user = User.new(role: :parcel_owner)
        allow(train).to receive(:user).and_return(user)
      end
    end

    context "when the user role is 'train_operator'" do
      before do
        user = User.new(role: :train_operator)
        allow(train).to receive(:user).and_return(user)
      end
    end
  end

  describe "enums" do
    it { should define_enum_for(:status).with_values(available: 0, booked: 1, left: 2, arrived: 3, withdrawn: 4) }
  end
end
