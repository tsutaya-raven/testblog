class BlogsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]

  def index
    @blog = Blog.page(params[:page]).per(5).order("created_at DESC")
    end
  end

  def new
  end

def create
      Blog.create(name: "", image: "", text: "",user_id: current_user.idn)
end

def destoroy
    blog = Blog.find(params[:id])
    if blog.user_id
      blog.destoroy
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(tweet_params)
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @comments = @blog.comments.includes(:user)
  end


   private
  def blog_params
    params.permit(:image,:text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end


