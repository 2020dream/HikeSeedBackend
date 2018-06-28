require "test_helper"

describe HikesController do

  describe 'index' do
    it "should get index" do
      get hikes_url

      expect(response).must_be :successful?
      expect(response.header['Content-Type']).must_include 'json'
    end

    it "should return all hikes with exactly the required fields" do
      keys = %w(distance lat lon name)

      get hikes_url
      body = JSON.parse(response.body)

      expect(body).must_be_kind_of Array
      expect(body.length).must_equal Hike.count
      body.each do |hike|
        expect(hike.keys.sort).must_equal keys
      end
    end

    it "should return empty array if there is no hikes" do
      Hike.all.each do |hike|
        hike.destroy
      end

      get hikes_url
      body = JSON.parse(response.body)

      expect(body.length).must_equal 0
    end
  end

  describe 'show' do

  end

  describe 'create' do

  end

  describe 'destroy' do

  end

end
