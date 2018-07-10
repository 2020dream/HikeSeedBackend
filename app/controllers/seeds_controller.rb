class SeedsController < ApplicationController
  def destroy
    @seed = Seed.find_by(id: params[:id])

    if @seed
      @seed.destroy
      render json: @seed.as_json(only: [:id, :nickname, :hike_id]), status: :ok
    else
      render json: {ok: false, cause: :not_found}, status: :not_found
    end
  end
end
