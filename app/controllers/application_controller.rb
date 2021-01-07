class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    person_path(resource)
  end

end
