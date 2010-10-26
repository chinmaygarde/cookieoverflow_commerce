require 'spec_helper'

describe Ability do
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
end
