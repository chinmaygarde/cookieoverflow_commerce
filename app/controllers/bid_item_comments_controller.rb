class BidItemCommentsController < ApplicationController

  def create
    @bid_item_comment = BidItemComment.new(params[:bid_item_comment])
    @bid_item_comment.user = current_user
    authorize! :create, @bid_item_comment
    if @bid_item_comment.save
      redirect_to(bid_item_path(@bid_item_comment.bid_item), :notice => 'BidItem was successfully created.')
    else
      redirect_to(bid_item_path(@bid_item_comment.bid_item), :notice => 'Error creating bid item.')
    end
  end

  def destroy
    @bid_item_comment = BidItemComment.find(params[:id])
    authorize! :destroy, @bid_item_comment
    @bid_item_comment.destroy
    redirect_to(root_url, :notice=>"Comment deleted")
  end
end
