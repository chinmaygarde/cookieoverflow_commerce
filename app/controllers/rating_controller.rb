class RatingController < ApplicationController
  before_filter :authenticate_user!
  
  def thumbsup
    user = User.find(params[:id])
    user.thumbsup = user.thumbsup + 1
    bidItem = BidItem.find(params[:id])
    user.save
    render :text => user.thumbsup
  end
  
  def thumbsdown
    user = User.find(params[:id])
    user.thumbsdown = user.thumbsdown + 1
    bidItem = BidItem.find(params[:id])
    user.save
    render :text => user.thumbsdown
  end
end
