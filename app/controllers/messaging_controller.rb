class MessagingController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def manage
    @user = current_user 
  end

  def create
    message = Message.new
    message.from_user = User.find(params[:from_user]) if params[:from_user]
    message.to_user = User.find(params[:to_user]) if params[:to_user]
    message.message = params[:message] if !params[:message].nil?
    if message.save
      redirect_to(inbox_path, :notice => "Message was sent")
    else
      redirect_to(inbox_path, :notice => "Message could not be sent")
    end
  end
  
  def read
    message = Message.find(params[:id])
    authorize! :update, message 
    message.unread = false
    message.save
    redirect_to(inbox_path, :notice => "Message was marked as read")
  end
end
