require 'spec_helper'

describe Ability do
  
  before(:each) do
    Resque.stub(:enqueue_at)
    Resque.stub(:enqueue)
  end
  
  it "should allow a user to edit or delete a bid_item_comment if he owns the comment" do
    user = Factory(:user)
    user.roles << Factory(:role, :title => "buyer")
    bid_item = Factory(:bid_item)
    comment = Factory(:bid_item_comment, :user => user, :bid_item => bid_item)
    ability = Ability.new(user)
    ability.can?(:update, comment).should be_true
    ability.can?(:destroy, comment).should be_true
  end
  
  it "should allow a seller to update his comments" do
    user = Factory(:user)
    user.roles << Factory(:role, :title => "seller")
    bid_item = Factory(:bid_item)
    comment = Factory(:bid_item_comment, :user => user, :bid_item => bid_item)
    ability = Ability.new(user)
    ability.can?(:update, comment).should be_true
  end
  
  it "should be able to update or destroy a message if the user is its owner" do
    user = Factory(:user)
    m = Factory(:message, :to_user => user)
    ability = Ability.new(user)
    ability.can?(:update, m).should be_true
    ability.can?(:destroy, m).should be_true
  end
end
