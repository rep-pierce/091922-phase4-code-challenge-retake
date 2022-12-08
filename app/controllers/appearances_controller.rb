class AppearancesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
    def create
        appearance = Appearance.create!(appearance_params)
        render json: appearance, status: :created
    end

    private

    def appearance_params
        params.permit(:id, :rating, episode_id, guest_id)
    end

    def render_record_invalid
        render json: { errors: "validation errors"}, status: :unprocessable_entity
    end


end
