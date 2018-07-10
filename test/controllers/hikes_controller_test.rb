require "test_helper"

describe HikesController do

  describe 'index' do
    it "should get index" do
      get hikes_url

      expect(response).must_be :successful?
      expect(response.header['Content-Type']).must_include 'json'
    end

    it "should return all hikes with exactly the required fields" do
      keys = %w(created_at distance id lat lon name seeds)

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
    it "should retrieve a valid hike" do
      get hike_url(hikes(:one).id)

      expect(response).must_be :successful?
    end

    it "should return 404 for hikes that are not found" do
      hike = hikes(:one)
      hike.destroy

      get hike_url(hike.id)
      body = JSON.parse(response.body)

      expect(response).must_be :not_found?
      expect(body).must_be_kind_of Hash
      expect(body).must_include 'ok'
      expect(body['ok']).must_equal false
      expect(body).must_include 'errors'
    end
  end

  describe 'create' do
    it "can create a valid hike" do
      hike = {
        name: "North Creek Trail",
        lat: "47.796825",
        lon: "-122.200852",
        distance: 2.5,
        seeds: [{
          nickname: 'test'
        }]
      }

      proc {
        post hikes_url, params: hike
      }.must_change 'Hike.count', 1
      body = JSON.parse(response.body)

      expect(response).must_be :successful?
      expect(response.header['Content-Type']).must_include 'json'
      expect(body.keys).must_include 'id'
    end

    it "should return 400 when given an invalid hike" do
      hike = {}

      proc {
        post hikes_url, params: hike
      }.must_change 'Hike.count', 0
      body = JSON.parse(response.body)

      expect(response).must_be :bad_request?
      expect(response.header['Content-Type']).must_include 'json'
      expect(body.keys).must_include "cause"
      expect(body["cause"]).must_equal "validation errors"
      expect(body["errors"].keys).must_include "name"
      expect(body["errors"]["name"]).must_include "can't be blank"
    end
  end

  describe 'destroy' do
    it "can delete an existing hike" do
      hike = hikes(:one)

      delete hike_url(hike.id)
      body = JSON.parse(response.body)

      expect(response).must_be :successful?
      expect(response.header['Content-Type']).must_include 'json'
      expect(body.keys).must_include 'id'
      expect(Hike.find_by(id: hike.id)).must_be_nil
    end

    it "should return 404 if the hike to be deleted doesn't exist" do
      hike = hikes(:one)
      hike.destroy

      delete hike_url(hike.id)
      body = JSON.parse(response.body)

      expect(response).must_be :not_found?
      expect(response.header['Content-Type']).must_include 'json'
      expect(body['ok']).must_equal false
      expect(body['cause']).must_equal 'not_found'
    end
  end

end
