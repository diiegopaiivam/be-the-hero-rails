class Api::V1::IncidentsController < Api::V1::ApiController
    acts_as_token_authentication_handler_for Ong
    before_action :require_authentication!

    private 
    def require_authentication!
        throw(:warden, scope: :user) unless current_ong.presence
    end
end
