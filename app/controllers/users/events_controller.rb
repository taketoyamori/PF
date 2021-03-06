class Users::EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :ensure_correct_user, only: [:update, :edit, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      tags = Vision.get_image_data(@event.event_image)
      tags.each do |tag|
        @event.tags.create(name: tag)
      end
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def index
    @events = Event.all.order(created_at: :desc).page(params[:page]).per(8).includes(:prefecture, :user)
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
    tag = Tag.where(event_id: @event.id)
    tag.delete_all
    if @event.update(event_params)
      tags = Vision.get_image_data(@event.event_image)
      tags.each do |tag|
        @event.tags.create(name: tag)
      end
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

  def ensure_correct_user
    @event = Event.find(params[:id])
    @user = @event.user
    unless @user == current_user
      redirect_to events_path
    end
  end
end
