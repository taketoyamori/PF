class Users::PersonsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :ensure_correct_user, only: [:update, :edit]

  def show
    @events = @user.events.order(created_at: :desc).page(params[:page]).per(9).includes(:prefecture)
    #DM機能の処理
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
  end

  def update
    if @user.update(person_params)
      redirect_to person_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.update(is_deleted: true)
    reset_session #sessionを切る=ログアウト
    flash[:notice] = "退会処理が完了しました。"
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def person_params
    params.require(:user).permit(:profile_image, :name, :email, :age, :introduction, :instagram, :twitter, :line)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to person_path(current_user.id)
    end
  end

end
