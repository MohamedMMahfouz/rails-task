class CommentsController < ApplicationController
   
    before_action :set_user
    before_action :set_post
    before_action :set_comment
 
    def index

        if params[:post_id]
            @comments = @post.comments
        else
            @comments = @user.comments
        end
        render json: @comments, status: :ok

    end
        # refactor
        # if params[:post_id] #get  all comments of a specific post
        #     @comments = @post.comments
        #     render json: @comments, status: :ok
        # else 
        #     if params[:user_id] #get all comments of a specific user
        #         @comments = @user.comments
        #         render json: @comments, status: :ok
        #     else
        #         render json: {error: 'no comments found'},
        #         status: :unprocessable_entity
        #     end
        # end

   
  
    def show
        render json: @comment, status: :ok
    end

    def destroy
        @comment.destroy
    end

    # refactor with methods and make one for show
    def update
        current_user_post_comment.update(comment_params)
        render json: @current_user_post_comment, status: :ok
    end
    
    # use current user in all create functions
    def create
        # @comment = Comment.new(comment_params)
        @comment = @current_user.comments.new(comment_params)
        if @comment.save
            render json: @comment, status: :created
        else
            render json: {errors: @comment.errors.full_messages}, 
            status: :unprocessable_entity
        end
    end


    private

    def set_user
        @user = User.find(params[:user_id]) if params[:user_id]
        
    end

    def set_post
       @post = Post.find(params[:post_id]) if params[:post_id]
    end

    def set_comment
        @comment = Comment.find(params[:id]) if params[:id]
     end

    def current_user_post
        
    end 

    def current_user_post_comment
        current_user_post =  @current_user.posts.find(params[:post_id]) if params[:post_id]
        @current_user_post_comment = current_user_post.comments.find(params[:id]) 
    end

    def comment_params
        params.permit(:id , :content, :user_id, :post_id)
    end

end