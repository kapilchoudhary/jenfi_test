require 'rails_helper'

RSpec.describe Line, type: :model do
  describe "associations" do
    it { should have_many(:train_lines) }
    it { should have_many(:trains).through(:train_lines) }
  end

  describe "enums" do
    it { should define_enum_for(:status).with_values(available: 0, engaged: 1) }
  end
end
