module ApplicationHelper
  def gravatar(arg)
    if arg.kind_of? User
      email = arg.email
    elsif arg.kind_of? String
      email = arg
    else
      email = "nothing"
    end
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}.jpg"
  end
end
