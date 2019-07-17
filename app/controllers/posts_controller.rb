class PostsController < ApplicationController
    before_action :authorize_request, exept: :create
    before_action :set_post, except: %i[create index]
    def index
        @posts = Post.all
        render json: @posts, status: :ok
    end

    def show
        render json: @post

    end
    
    def create 
        @post = Post.new(post_params)
        if @post.save
            render json: @post , status: :created
        else
            render json: {error: @post.errors.full_messages},
            status: :unprocessable_entity
        end
    end


    def destroy
        @post.destroy
    end

    def update
        @post = @current_user.posts.find(params[:id]).update(post_params)
        render json: @post , status: :ok
    end

    
    private

    def set_post
        @post = Post.find(params[:id])
    end

    # def post_create_params
    #     params.permit(:content , :user_id )
    # end

    def post_params
        params.permit(:id,:user_id ,:content , tags_attributes: [:name , :id , :_destroy])
    end

end