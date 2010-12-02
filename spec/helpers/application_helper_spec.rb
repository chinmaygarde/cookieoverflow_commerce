require 'spec_helper'
include ApplicationHelper

describe ApplicationHelper do
  before(:each) do
    Resque.stub(:enqueue_at)
    Resque.stub(:enqueue)
  end
  it "should construct a gravatar url given an email" do
    gravatar("admin@admin.com").should == "http://www.gravatar.com/avatar/64e1b8d34f425d19e1ee2ea7236d3028.jpg"
  end
  it "should construct a gravatar url given a user" do
    u = Factory(:user, :email => "admin@admin.com")
    gravatar(u).should == "http://www.gravatar.com/avatar/64e1b8d34f425d19e1ee2ea7236d3028.jpg"
  end
  it "should construct a gravatar url given some junk object" do
    u = Factory(:bid_item)
    gravatar(u).class.should == String
  end
end
