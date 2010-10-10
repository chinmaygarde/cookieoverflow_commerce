require 'spec_helper'

describe User do
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
end
