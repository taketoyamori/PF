class ApplicationController < ActionController::Base
  def authenticate_admin
    if @current_user.nil?
      # flash[:notice]="ログインが必要です"
      redirect_to new_admin_session_path
    end
  end

  def after_sign_in_path_for(resource)
    person_path(resource)
  end
end
