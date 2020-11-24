class Api::V1::IncidentsController < Api::V1::ApiController
    acts_as_token_authentication_handler_for Ong
    before_action :require_authentication!
    before_action :set_incident, only: [:show, :update, :destroy]

    def index
        @incidents = Incident.all  
        render json: @incidents
    end

    def show
        @incidents = Incident.joins(:ong).select("incidents.*, ongs.contact").find params[:id]
        render json: @incidents
    end 

    def create
        @incident = Incident.new(incident_params.merge(ong: current_ong))

        if @incident.save
            render json: @incident
        else 
            render json: @incident.errors, status: :unprocessable_entity
        end
    end

    def update
        if @incident.update(incident_params)
            render json: @incident
        else 
            render json: @incident.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @incident.destroy
    end

    private 

        def set_incident
            @incident = Incident.find(params[:id])
        end

        def incident_params
            params.require(:incident).permit(:title, :description, :value)
        end

        def require_authentication!
            throw(:warden, scope: :user) unless current_ong.presence
        end
end
