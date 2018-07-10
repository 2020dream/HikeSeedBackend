require "test_helper"

describe SeedsController do
  it "should get destroy" do
    get seeds_destroy_url
    value(response).must_be :success?
  end

end
