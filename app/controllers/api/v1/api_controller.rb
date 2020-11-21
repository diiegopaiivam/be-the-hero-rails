module Api::V1
    class ApiController < ApplicationController
        acts_as_token_authentication_handler_for Ong
        before_action :require_authentication!

        private 
        def require_authentication!
            throw (:warden, scope: :ong) unless current_ong.presence
        end
    end
end