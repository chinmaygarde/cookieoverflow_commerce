class NotifyPreviousHighestBidder
  @queue = :mail
  def self.perform(bid_item_id, user_id)
    bid_item = BidItem.find(bid_item_id)
    user = User.find(user_id)
    UserMailer.deliver_buyer_no_longer_highest_bidder_message(bid_item, user)
  end
end