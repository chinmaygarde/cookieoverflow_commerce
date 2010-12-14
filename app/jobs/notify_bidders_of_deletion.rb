class NotifyBiddersOfDeletion
  @queue = :mail
  def self.perform(description, mails)
    UserMailer.bid_item_deletion_message(description, mails).deliver
  end
end