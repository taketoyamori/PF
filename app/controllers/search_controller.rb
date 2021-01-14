class SearchController < ApplicationController

  def locate
    @search_params = event_search_params
    @events = Event.search(@search_params).includes(:prefecture, :user)
  end

  private

  def event_search_params
    params.fetch(:search, {}).permit(:date, :prefecture_id)
  end

end
