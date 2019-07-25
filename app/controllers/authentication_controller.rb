class AuthenticationController < ApplicationController

    before_action :authorize_request, except: :login

    def login
        logger.info("+++++++++++++++")
        logger.info(params)
        @user = User.find_by_e_mail(params[:e_mail])
        if @user&.authenticate(params[:password])
            token = JsonWebToken.encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            render json: {
                token: token,
                exp: time.strftime("%m-%d-%Y %H:%M"), 
                name: @user.name,
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Expose-Headers': 'ETag',
                'Access-Control-Allow-Methods': 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD',
                'Access-Control-Allow-Headers': '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match',
                'Access-Control-Max-Age': '86400'
                }, status: :ok
        else
            render json: {
                error: 'unauthorized',
                # 'Access-Control-Allow-Origin': '*',
                # 'Access-Control-Expose-Headers': 'ETag',
                # 'Access-Control-Allow-Methods': 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD',
                # 'Access-Control-Allow-Headers': '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match',
                # 'Access-Control-Max-Age': '86400'
                }, status: :unauthorized
        end

    end

    private

    def login_params
        params.permit(:e_mail, :password)
    end
end