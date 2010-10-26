require 'spec_helper'

describe AdminMailer do
  it "should be able to send a mail to an admin" do
    ActionMailer::Base.delivery_method = :test  
    ActionMailer::Base.perform_deliveries = true  
    ActionMailer::Base.deliveries = []
    u = Factory(:user)
    AdminMailer.deliver_admin_message(u, "Message")
    ActionMailer::Base.deliveries.size.should == 1
  end
end
