require "test_helper"

describe HikesController do
  it "should get index" do
    get hikes_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get hikes_show_url
    value(response).must_be :success?
  end

  it "should get create" do
    get hikes_create_url
    value(response).must_be :success?
  end

  it "should get destroy" do
    get hikes_destroy_url
    value(response).must_be :success?
  end

end
