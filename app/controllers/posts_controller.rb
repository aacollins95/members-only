class PostsController < ApplicationController
  before_action :make_posts, only: [:new,:create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user_id: @current_user.id, title: params[:post][:title],
                     content: params[:post][:content])
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  private

  def make_posts
    current_user
    unless logged_in?(@current_user)
      redirect_to login_url
    end
  end
end
