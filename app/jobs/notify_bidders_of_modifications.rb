class NotifyBiddersOfModifications
  @queue = :mail
  def self.perform(bid_item_id, message)
    UserMailer.deliver_bid_item_modification_message(BidItem.find(bid_item_id), message)
  end
end