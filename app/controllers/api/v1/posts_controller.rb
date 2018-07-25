class PostsController < ApplicationController
  skip_before_action :current_user, only: [:show, :index]

  def create
    @post = Post.new(post_params)
    if @post.save
      head :created
    else
      head :bad_request
    end
  end

  def show
    @post = Post.find(params[:id])
    render json: @post.as_json
  end

  def index
    @posts = Post.all
    render json: @posts.as_json
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      render json: @post.as_json
    else
      head :bad_request
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.delete
      head :ok
    else
      head :bad_request
    end
  end

  def post_params
    params.require(:post).permit(:title,
                                 :text)
  end
end
