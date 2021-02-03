class TagController < ApplicationController

  def search
    tag = Tag.find(params[:id])
    tags = Tag.where(name: "#{tag.name}")
    events = []
    tags.each do |tag|
      events << tag.event_id
    end
    @searchevent = Event.where(id: events).order(created_at: :desc).page(params[:page]).per(8)
  end

end
