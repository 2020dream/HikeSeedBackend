require "test_helper"

describe Hike do

  describe 'validations' do
    let(:hike) { hikes(:one) }

    it "must be valid" do
      value(hike).must_be :valid?
    end

    it "must have name" do
      hike.name = nil
      hike.valid?.must_equal false
    end

    it "must have lat" do
      hike.lat = nil
      hike.valid?.must_equal false
    end

    it "must have lon" do
      hike.lon = nil
      hike.valid?.must_equal false
    end

    it "must have distance" do
      hike.distance = nil
      hike.valid?.must_equal false
    end
  end

  describe 'relationships' do
    it "can have many seeds" do
      hike = hikes(:one)
      hike.seeds.count.must_equal 2
    end

    it "can destroy seeds when destroy hike" do
      seeds = hikes(:one).seeds
      seeds.count.must_equal 2
      hikes(:one).destroy
      seeds.count.must_equal 0
    end

    it "can have 0 seeds" do
      hike = hikes(:two)
      hike.seeds.count.must_equal 0
    end
  end

  describe 'methods' do
    it "returns the right seed count" do
      hikes(:one).total_seeds.must_equal 2
    end

    it "returns 0 if no seed exists" do
      hikes(:two).total_seeds.must_equal 0
    end
  end

end
