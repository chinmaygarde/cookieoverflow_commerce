class MailAdmin
  @queue = :mail
  def self.perform(user_id, message)
    AdminMailer.admin_message(User.find(user_id), message).deliver
  end
end