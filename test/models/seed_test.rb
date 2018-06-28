require "test_helper"

describe Seed do

  describe 'validations' do
    let(:seed) { seeds(:one) }

    it "must be valid" do
      value(seed).must_be :valid?
    end

    it "must have nickname" do
      seed.nickname = nil
      seed.valid?.must_equal false
    end
  end

  describe 'relationships' do
    it "belongs to a hike" do
      seeds(:one).hike.must_equal hikes(:one)
    end
  end
  
end
