class PostsController < ApplicationController
  # before_action :authenticate_user!
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    # @post.user_id = current_user.id
    # @post.save
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end
end
