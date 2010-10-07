require 'spec_helper'

describe Ability do
  it "should be able to set abilities of non admins" do
    u = Factory(:user)
    u.roles.delete_all
    b = Factory(:bid_item)
    a = Ability.new(u)
    a.can?(:read, b).should == true
    a.can?(:manage, b).should == false
  end
end
