class Tag < ActiveRecord::Base
  has_and_belongs_to_many :bid_items
  
  def add_bid_item(bid_item)
    bid_items << bid_item
  end
end
