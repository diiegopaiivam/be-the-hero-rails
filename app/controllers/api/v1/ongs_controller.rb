class Api::V1::OngsController < Api::V1::ApiController


    private 
        def set_ong
            @ong = Ong.find(params[:id])
        end

        def ong_params
            params.require(:ong).permit(:name, :email)
        end

end
