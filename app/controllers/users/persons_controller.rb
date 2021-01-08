class Users::PersonsController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user= User.find(params[:id])
    if @user.update(person_params)
      redirect_to person_path(@user)
    else
      render :edit
    end
  end

  #とりあえず時間短縮でユーザー情報物理削除
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
    #論理削除か悩み中（時間あれば論理削除にしようかな）
    #論理削除にしたらユーザーに紐ずくデータどうするか考える※dependent=>destroyで消えない？
  end

  private

  def person_params
    params.require(:user).permit(:profile_image, :name, :email, :age, :introduction, :instagram, :twitter, :line)
  end

end
