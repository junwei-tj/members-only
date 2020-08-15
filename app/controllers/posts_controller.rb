class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    
    if @post.save
      flash.notice = "Post '#{@post.title}' Created!"
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def post_params
    params.permit(:title, :body)
  end

end
