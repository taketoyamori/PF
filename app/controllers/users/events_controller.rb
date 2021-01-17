class Users::EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def index
    @events = Event.all.page(params[:page]).per(8)
  end

  def show
    @event = Event.find(params[:id])
    @comments = @event.comments
    @user = @event.user
    @comment = Comment.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to person_path(current_user)
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :prefecture_id, :title, :introduction, :date, :event_image)
  end

end
