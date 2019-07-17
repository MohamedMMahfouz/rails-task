class TagsController < ApplicationController
    before_action :authorize_request, execpt: :create
    before_action :set_tag, except: %i[create index]
    
    def index
        @tags = Tag.all
        render json: @tags, status: :ok
    end

    def show
        render json: @tag , status: :ok
    end

    def destroy
        @tag.destroy
    end

    def create
        @tag = Tag.new(tag_params)
        if @tag.save
            render json: @tag , status: :created
        else
            render json: {error: @tag.errors.full_messages},
            status: :unprocessable_entity
    end

    private
    def set_tag
        @tag = Tag.find(params[:id]) 
    end

    def tag_params
        params.permit(:name)
    end
end
