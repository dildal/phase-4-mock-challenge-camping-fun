class SignupsController < ApplicationController

    def create
        signup = Signup.create!(signups_params)
        render json: Activity.find(params[:activity_id]), status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    private 
    def signups_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
