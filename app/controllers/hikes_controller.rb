class HikesController < ApplicationController
  def index
    @hikes = Hike.all

    render json: @hikes.as_json(only: [:name, :lat, :lon, :distance])
  end

  def show
  end

  def create
  end

  def destroy
  end
end
