require "test_helper"

describe SeedsController do

  describe 'destroy' do
    it "can delete an existing seed" do
      seed = seeds(:one)

      delete seed_url(seed.id)
      body = JSON.parse(response.body)

      expect(response).must_be :successful?
      expect(response.header['Content-Type']).must_include 'json'
      expect(body.keys).must_include 'id'
      expect(Seed.find_by(id: seed.id)).must_be_nil
    end

    it "should return 404 if the seed to be deleted doesn't exist" do
      seed = seeds(:one)
      seed.destroy

      delete seed_url(seed.id)
      body = JSON.parse(response.body)

      expect(response).must_be :not_found?
      expect(response.header['Content-Type']).must_include 'json'
      expect(body['ok']).must_equal false
      expect(body['cause']).must_equal 'not_found'
    end
  end

end
