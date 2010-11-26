require 'spec_helper'

describe Message do
  before(:each) do
    @valid_attributes = {
      :from_user => 1,
      :to_user => 1,
      :message => "value for message",
      :unread => false
    }
  end

  it "should create a new instance given valid attributes" do
    Message.create!(@valid_attributes)
  end
end
