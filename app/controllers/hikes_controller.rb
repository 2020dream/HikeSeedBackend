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
    @hike = Hike.create(hike_params)

    if @hike.valid?
      render json: {id: @hike.id}, status: :ok
    else
      render json: {ok: false, cause: "validation errors", errors: @hike.errors}, status: :bad_request
    end
  end

  def destroy
  end

  private

  def hike_params
    return params.permit(:name, :lat, :lon, :distance)
  end
end
