class Admins::ManagementsController < ApplicationController

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def destroy
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    redirect_to admins_managements_path
  end

end
