class PostsController < ApplicationController
  before_action :redirect, except: [:index]
  def index
    @posts = Post.includes(:teacher).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.save
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def posts_params
    params.require(:post).permit(:movie, :title, :text).merge(teacher_id: current_teacher.id)
  end

  def redirect
    unless teacher_signed_in?
      redirect_to posts_path
    end
  end
end
