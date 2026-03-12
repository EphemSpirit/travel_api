require 'rails_helper'

RSpec.describe Airport, type: :model do
  context "validations" do
    it "is valid with valid attributes" do
      airport = FactoryBot.build(:airport)
      expect(airport).to be_valid
    end

    it "is not valid without a code" do
      airport = FactoryBot.build(:airport, code: nil)
      expect(airport).not_to be_valid
    end

    it "is not valid without a name" do
      airport = FactoryBot.build(:airport, name: nil)
      expect(airport).not_to be_valid
    end
  end
end
