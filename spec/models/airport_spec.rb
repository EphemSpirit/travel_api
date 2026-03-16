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

    it "is not valid without a country" do
      airport = FactoryBot.build(:airport, country: nil)
      expect(airport).not_to be_valid
    end

    it "is not valid without a city" do
      airport = FactoryBot.build(:airport, city: nil)
      expect(airport).not_to be_valid
    end

    it "is not valid without terminals" do
      airport = FactoryBot.build(:airport, terminals: nil)
      expect(airport).not_to be_valid
    end

    it "is not valid with a code shorter than 3 characters" do
      airport = FactoryBot.build(:airport, code: "AB")
      expect(airport).not_to be_valid
    end

    it "is not valid with a code longer than 3 characters" do
      airport = FactoryBot.build(:airport, code: "ABCD")
      expect(airport).not_to be_valid
    end

    it "is not valid with a dup'd code" do
      FactoryBot.create(:airport, code: "DUP")
      airport = FactoryBot.build(:airport, code: "DUP")
      expect(airport).not_to be_valid
    end
  end
end
