class RatingController < ApplicationController

  def thumbsdown
    user = User.find(params[:user_id])
    user.thumbsdown = user.thumbsdown + 1
    bidItem = BidItem.find(params[:bid_item_id])
    if user.save
      redirect_to(bid_item_path(bidItem.id), :action => 'show' ,:notice => 'Rating was successfully created.')
    else
      redirect_to(bid_item_path(bidItem.id), :action => 'show' ,:notice => 'Rating could not be added')
    end
  end

  def thumbsup
    user = User.find(params[:user_id])
    user.thumbsup = user.thumbsup + 1
    bidItem = BidItem.find(params[:bid_item_id])
    if user.save
      redirect_to(bid_item_path(bidItem.id), :action => 'show' ,:notice => 'Rating was successfully created.')
    else
      redirect_to(bid_item_path(bidItem.id), :action => 'show' ,:notice => 'Rating could not be added')
    end
  end
end
