class NotifyBiddersOfModifications
  @queue = :mail
  def self.perform(bid_item_id, message)
    UserMailer.bid_item_modification_message(BidItem.find(bid_item_id), message).deliver
  end
end