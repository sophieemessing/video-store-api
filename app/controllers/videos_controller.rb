class VideosController < ApplicationController

  def index
    videos = Video.all

    render json: videos.as_json(only: [:id, :title, :release_date, :available_inventory]), status: :ok
  end

  def show
    video = Video.find_by(id: params[:id])

    if video.nil?
      return render json: {ok: false, message: "Video not found", errors: ['Not Found']}, status: :not_found
    end

    render json: video.as_json(only: [:title, :overview, :release_date, :total_inventory, :available_inventory]), status: :ok
  end

  def create
    video = Video.new(video_params)

    if video.save
      render json: video.as_json(only: [:id]), status: :created
    else
      render json: {
          ok: false,
          errors: video.errors.messages
      }, status: :bad_request
      return
    end
  end

  private

  def video_params
    params.permit(:title, :overview, :release_date, :total_inventory, :available_inventory)
  end
end