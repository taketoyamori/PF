class Users::BlogsController < ApplicationController

  def index
    @blogs = Post.all.page(params[:page]).per(8)
  end

  def show
    @blog = Post.find(params[:id])
  end

end
