class Users::CommentsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    comment = current_user.comments.new(comment_params)
    comment.event_id = @event.id
    comment.save
    @comment = Event.find(params[:event_id]).comments
  end

  def destroy
    Comment.find_by(id: params[:id], event_id: params[:event_id]).destroy
    @comment = Event.find(params[:event_id]).comments
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
