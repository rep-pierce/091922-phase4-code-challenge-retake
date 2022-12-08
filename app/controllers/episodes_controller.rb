class EpisodesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response
    def index
        episodes = Episode.all
        render json: episodes, status: :ok
    end

    def show
        episode = find_episode
        render json: episode, include: :guests
    end

    def destroy
        episode = find_episode
        episode.destroy
        head :no_content
    end

    private
    def episode_params
        params.permit(:id, :name, :number, :guests)
    end

    def find_episode
        Episode.find_by(params[:id])
    end

    def record_not_found_response(exception)
        render json: {"error": "Episode not found"}
    end
end
