class RatingController < ApplicationController
  before_filter :authenticate_user!
  
  def thumbsup
    user = User.find(params[:user_id])
    user.thumbsup = user.thumbsup + 1
    bidItem = BidItem.find(params[:bid_item_id])
    user.save
    redirect_to(bid_item_path(bidItem.id), :action => 'show' ,:notice => 'Rating was successfully created.')
  end
  
  def thumbsdown
    user = User.find(params[:user_id])
    user.thumbsdown = user.thumbsdown + 1
    bidItem = BidItem.find(params[:bid_item_id])
    user.save
    redirect_to(bid_item_path(bidItem.id), :action => 'show' ,:notice => 'Rating was successfully created.')
  end
end
