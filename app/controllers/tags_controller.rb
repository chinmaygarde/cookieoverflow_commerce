class TagsController < ApplicationController
  def create
    @tag = Tag.new
    @tag.title = params[:title]
    bid_item = BidItem.find(params[:bid_item_id])
    @tag.add_bid_item(bid_item)
    authorize! :create, @tag
    if @tag.save
      redirect_to(bid_item, :notice => 'Tag was successfully created.')
    else
      redirect_to(bid_item, :notice => 'Error creating Tags.')
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    authorize! :destroy, @tag
    @tag.destroy
    redirect_to(root_url, :notice=>"Comment deleted")
  end
end
