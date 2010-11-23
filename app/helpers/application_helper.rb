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
  
  def truncate(text, count=100)
    if text.length <= count
      text
    else
      text[0,count] + "..."
    end
  end
end
