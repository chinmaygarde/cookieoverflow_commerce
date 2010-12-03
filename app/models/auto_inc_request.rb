class AutoIncRequest < ActiveRecord::Base
  belongs_to :bid_item
  belongs_to :user
  
  validates_presence_of :bid_item_id, :user_id, :maximum_amount
  validates_uniqueness_of :bid_item_id, :scope => :user_id, :message => "already has an automatic bidder setup by you."
  
  validate :ceiling_is_high_enough
  
  after_create :place_first_bid_if_not_highest
  
  def place_first_bid_if_not_highest
    if !bid_item.highest_bid.nil? && bid_item.highest_bid.user != user
      Bid.create(:user => user, :bid_item => bid_item, :bid_amount => bid_item.minimum_bidding_price)
    end
  end
  
  def ceiling_is_high_enough
    errors.add(:maximum_amount, "can't be lesser current minimum bid + $100.") if maximum_amount < bid_item.minimum_bidding_price + 100
  end
end
