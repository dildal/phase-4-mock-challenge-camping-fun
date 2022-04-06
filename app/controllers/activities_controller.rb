class ActivitiesController < ApplicationController
    def index
        render json: Activity.all, status: :ok
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
    rescue ActiveRecord::RecordNotFound => invalid
        render json: { error: "Activity not found" }, status: :not_found
    end
end
