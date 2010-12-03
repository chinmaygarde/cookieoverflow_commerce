require 'spec_helper'

describe User do
  before(:each) do
    Resque.stub(:enqueue_at)
    Resque.stub(:enqueue)
  end
  it "should be able to check if it is in a role" do
    u = Factory(:user)
    u.roles << Factory(:role, :title => "foo")
    u.role?("foo").should == true
  end
  it "should be able to update roles" do
    u = Factory(:user)

    r1 = Factory(:role, :title => "foo")
    r2 = Factory(:role, :title => "bar")
    r3 = Factory(:role, :title => "baz")
    r4 = Factory(:role, :title => "bang")
    
    u.roles << r1
    u.roles << r2
    
    u.update_roles("baz", "bang")
    
    u.role?("foo").should == false
    u.role?("bar").should == false
    
    u.role?("baz").should == true
    u.role?("bang").should == true
  end
  
  it "should be able to become a seller" do
    u = Factory(:user)
    r = Factory(:role, :title => "seller")
    u.roles.delete_all
    u.become_seller
    u.roles.size.should == 1
    u.role?("seller").should be_true
  end
  
  it "should get recent auction for user" do
    u = Factory(:user)
    10.times do
      Factory(:bid_item, :user => u)
    end
    u.recent_auctions(3).size.should == 3
  end
  
  it "should get recent bids for user" do
    u = Factory(:user)
    10.times do
      Factory(:bid, :user => u)
    end
    u.recent_bids(3).size.should == 3
  end
  
  it "should get unread messages for user" do
      u = Factory(:user)
      u2 = Factory(:user)
      10.times do
        Factory(:message, :to_user => u, :from_user => u2, :unread => true)
      end
      u.unread_messages(25).size.should == 10
    end
  
  it "should get read messages for user" do
    u = Factory(:user)
    u2 = Factory(:user)
    7.times do
      Factory(:message, :to_user => u, :from_user => u2, :unread => false)
    end
    u.read_messages(25).size.should == 7
  end
  
  it "should get sent messages for user" do
    u = Factory(:user)
    u2 = Factory(:user)
    7.times do
      Factory(:message, :to_user => u, :from_user => u2, :unread => false)
    end
    u2.sent_messages(25).size.should == 7
  end
end
