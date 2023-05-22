require 'rails_helper'

RSpec.describe TrainLine, type: :model do
  describe "associations" do
    it { should belong_to(:train) }
    it { should belong_to(:line) }
  end
end
