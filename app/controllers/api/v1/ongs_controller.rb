class Api::V1::OngsController < Api::V1::ApiController
    before_action :set_ong, only: [:show, :update, :destroy]

    def index
        @ongs = Ong.all
        render json: @ongs
    end

    def show
        render json: @ong
    end

    def create
        @ong = Ong.new(ong_params)

        if @ong.save
            render json: @ong, status: :created
        else 
            render json: @ong.errors, status: :unprocessable_entity
        end
    end

    def update
        if @ong.update(ong_params)
            render json: @ong
        else 
            render json: @ong.errors, status: unprocessable_entity
        end
    end

    def destroy
        @ong.destroy
    end

    private 
        def set_ong
            @ong = Ong.find(params[:id])
        end

        def ong_params
            params.require(:ong).permit(:name, :email, :password)
        end

end
