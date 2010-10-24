class MailAdmin
  @queue = :mail
  def self.perform(user_id, message)
    AdminMailer.deliver_admin_message(User.find(user_id), message)
  end
end