class Users::RelationshipsController < ApplicationController

  def create
    relationship = current_user.reporter_relationships.build(violator_id: params[:person_id])
    relationship.save
    redirect_to request.referrer || root_url
  end

  def destroy
    relationship = current_user.reporter_relationships.find_by(violator_id: params[:person_id])
    relationship.destroy
    redirect_to request.referrer || root_url
  end

end
