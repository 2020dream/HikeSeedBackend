class HikesController < ApplicationController
  def index
    @hikes = Hike.all

    render json: @hikes.as_json(only: [:id, :name, :lat, :lon, :distance, :created_at], include: :seeds)
  end

  def show
    @hike = Hike.find_by(id: params[:id])

    if @hike
      render json: @hike.as_json(only: [:id, :name, :lat, :lon, :distance, :created_at], include: :seeds)
    else
      render json: {ok: false, :errors => "Hike not found"}, status: :not_found
    end
  end

  def create
    @hike = Hike.create_with_seeds(hike_params)

    if @hike.valid?
      render json: @hike.as_json(only: [:id, :name, :lat, :lon, :distance, :created_at], include: :seeds), status: :ok
    else
      render json: {ok: false, cause: "validation errors", errors: @hike.errors}, status: :bad_request
    end
  end

  def destroy
    @hike = Hike.find_by(id: params[:id])

    if @hike
      @hike.destroy
      render json: @hike.as_json(only: [:id, :name, :lat, :lon, :distance, :created_at]), status: :ok
    else
      render json: {ok: false, cause: :not_found}, status: :not_found
    end
  end

  private

  def hike_params
    return params.permit(:name, :lat, :lon, :distance, seeds: [:nickname])
  end
end
