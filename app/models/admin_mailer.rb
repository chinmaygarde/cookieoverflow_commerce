class AdminMailer < ActionMailer::Base
  def admin_message(user, message)
    recipients  "osprey@buzzyand.me"
    subject     "OSPREY: Message from #{user.email}"
    body        :user => user, :message => message
    sent_on     Time.now
    content_type "text/html"
    reply_to    user.email
  end
end
