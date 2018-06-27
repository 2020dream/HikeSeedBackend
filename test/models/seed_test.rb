require "test_helper"

describe Seed do
  let(:seed) { Seed.new }

  it "must be valid" do
    value(seed).must_be :valid?
  end
end
