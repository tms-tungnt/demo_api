class Api::V1::PostsController < Api::V1::ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]
    # GET /posts
    def index
        @posts = Post.all
        render_json(@posts)
    end

    # POST /posts
    def create
        @post = Post.create!(post_params)
        render_json(@post, :created)
    end

    # GET /posts/:id
    def show
        render_json(@post)
    end

    # PUT /posts/:id
    def update
        if @post.update(post_params)
            render_json(@post)
        else
            error_response
        end
    end

    # DELETE /posts/:id
    def destroy
        if @post.destroy
            render_json(message: 'Deleted', status: :ok)
        else
            error_response
        end
    end

    private

    def post_params
      # whitelist params
      params.permit(:title, :description)
    end

    def set_post
        @post = Post.find_by(id: params[:id])
        render_json(message: 'Could not find Post with id = ' + params[:id], status: :error) if @post.nil?
    end

    def error_response(status = :error)
        render_json(message: :error, status: status)
    end
end
