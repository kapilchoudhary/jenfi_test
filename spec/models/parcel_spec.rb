require 'rails_helper'

RSpec.describe Parcel, type: :model do
  describe "enums" do
    it { should define_enum_for(:status).with_values(to_be_shipped: 0, shipping: 1, shipped: 2, withdrawn: 3) }
  end

  describe "custom validation" do
    let(:parcel) { Parcel.new }

    context "when the user role is 'parcel_owner'" do
      before do
        user = User.new(role: :parcel_owner)
        allow(User).to receive(:find).and_return(user)
      end

      it "does not add any errors" do
        parcel.validate
        expect(parcel.errors[:base]).to be_empty
      end
    end
  end
end
