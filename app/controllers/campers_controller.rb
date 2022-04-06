class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid_response

    def index
        render json: Camper.all, status: :ok
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperDetailSerializer, status: :ok
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end
    private 

    def camper_params 
        params.permit(:name, :age)
    end

    def render_record_not_found_response
        render json: { error: "Camper not found" }, status: :not_found
    end

    def render_record_invalid_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
