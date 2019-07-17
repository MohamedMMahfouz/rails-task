class UsersController < ApplicationController
    before_action :authorize_request, exept: :create
    before_action :find_user , except: %i[create index]
    
    
    def index
        @users = User.all
        render json: @users, status: :ok
    end
    

    def show
        render json: @user, status: :ok
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else
            render json: {errors: @user.errors.full_messages}, 
            status: :unprocessable_entity
        end
    end
    
    def destroy
        @user.destroy
    end

    def update
        
            @current_user.update(user_params)
            render json: @current_user, status: :created

    end
    
    private

    def find_user
        @user = User.find(params[:id])
        # @userposts = @user ? @user.posts :  Post.scoped
        rescue ActiveRecord::RecordNotFound
            render json: {errors: 'user not found'} , status: :not_found
    end
    
    
    def user_params
        params.permit(:name , :e_mail , :password)
    end

    
    
end