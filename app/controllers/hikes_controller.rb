class HikesController < ApplicationController
  def index
    @hikes = Hike.all

    render json: @hikes.as_json(only: [:name, :lat, :lon, :distance, :created_at])
  end

  def show
    @hike = Hike.find_by(id: params[:id])

    if @hike
      render json: @hike.as_json(only: [:name, :lat, :lon, :distance, :created_at])
    else
      render json: {ok: false, :errors => "Hike not found"}, status: :not_found
    end
  end

  def create
  end

  def destroy
  end
end
