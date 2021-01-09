class Users::FavoritesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    favorite = current_user.favorites.new(event_id: @event.id)
    favorite.save
    #非同期通信予定の為以下記述は仮
    redirect_to request.referrer || root_url
  end

  def destroy
    @event = Event.find(params[:event_id])
    favorite = current_user.favorites.find_by(event_id: @event.id)
    favorite.destroy
    #非同期通信予定の為以下記述は仮
    redirect_to request.referrer || root_url
  end

end
