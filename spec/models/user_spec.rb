require 'spec_helper'

describe User do
  it "should be able to check if it is in a role" do
    u = Factory(:user)
    u.roles << Factory(:role, :title => "foo")
    u.role?("foo").should == true
  end
end
