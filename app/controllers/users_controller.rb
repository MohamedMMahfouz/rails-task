class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create
    before_action :find_user , except: %i[create index]
    # global before calls in app contr
    
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
        @current_user.destroy
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
            # global rescue
    end
    
    
    def user_params
        params.permit(:name , :e_mail , :password)
    end

    
    
end