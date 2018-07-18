class HikesController < ApplicationController
  def index
    @hikes = Hike.all

    render json: @hikes.as_json(only: [:id, :name, :origin_lat, :origin_lon, :lat, :lon, :distance, :date, :is_harvest], include: :seeds)
  end

  def show
    @hike = Hike.find_by(id: params[:id])

    if @hike
      render json: @hike.as_json(only: [:id, :name, :origin_lat, :origin_lon, :lat, :lon, :distance, :date, :is_harvest], include: :seeds)
    else
      render json: {ok: false, :errors => "Hike not found"}, status: :not_found
    end
  end

  def create
    @hike = Hike.create_with_seeds(hike_params)

    if @hike.valid?
      render json: @hike.as_json(only: [:id, :name, :origin_lat, :origin_lon, :lat, :lon, :distance, :date, :is_harvest], include: :seeds), status: :ok
    else
      render json: {ok: false, cause: "validation errors", errors: @hike.errors}, status: :bad_request
    end
  end

  def update
    @hike = Hike.find_by(id: params[:id])
    @hike.update(is_harvest: true)

    if !@hike.valid?
      render json: {ok: false, cause: "validation errors", errors: @hike.errors}, status: :bad_request
    end
  end

  def destroy
    @hike = Hike.find_by(id: params[:id])

    if @hike
      @hike.destroy
      render json: @hike.as_json(only: [:id, :name, :origin_lat, :origin_lon, :lat, :lon, :distance, :date, :is_harvest]), status: :ok
    else
      render json: {ok: false, cause: :not_found}, status: :not_found
    end
  end

  private

  def hike_params
    return params.permit(:name, :origin_lat, :origin_lon, :lat, :lon, :distance, :date, :is_harvest, seeds: [:nickname])
  end
end
