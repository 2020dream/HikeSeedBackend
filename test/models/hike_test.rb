require "test_helper"

describe Hike do
  let(:hike) { Hike.new }

  it "must be valid" do
    value(hike).must_be :valid?
  end
end
