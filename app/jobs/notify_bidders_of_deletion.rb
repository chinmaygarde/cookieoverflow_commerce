class NotifyBiddersOfDeletion
  @queue = :mail
  def self.perform(description, mails)
    UserMailer.deliver_bid_item_deletion_message(description, mails)
  end
end