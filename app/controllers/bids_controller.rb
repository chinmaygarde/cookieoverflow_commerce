class BidsController < ApplicationController  
  def create
    @bid = Bid.new(params[:bid])
    @bid.bid_item = BidItem.find(params[:bid_item_id])
    @bid.user = current_user
    authorize! :create, @bid
    if @bid.save
      redirect_to(@bid.bid_item, :notice => 'Bid was successfully created.')
    else
      redirect_to(@bid.bid_item, :notice => 'Could not create a bid. Was your amount high enough?')
    end
  end

  def destroy
    @bid = Bid.find(params[:id])
    authorize! :destroy, @bid
    @bid.destroy
    redirect_to(@bid.bid_item, :notice=>"Comment deleted")
  end
end
