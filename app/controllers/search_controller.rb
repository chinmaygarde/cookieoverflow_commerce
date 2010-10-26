class SearchController < ApplicationController
  def bid_item
    data = Array.new
    if !params[:q].nil? && params[:q].length > 2
      bid_items = BidItem.search("*#{params[:q]}*")
      bid_items.each do |item|
        data << {:value => "#{item.id}", :name => "#{item.title}"}
      end
    end
    respond_to do |format|
      format.json { render :json => data}
    end
  end
end
