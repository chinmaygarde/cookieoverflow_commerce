require 'spec_helper'

describe NotifyBiddersOfDeletion do
  it "should enqueue the background job to notify the user of deletion" do
    UserMailer.stub(:deliver_bid_item_deletion_message).with("Foo", "Bar")
    NotifyBiddersOfDeletion.perform("Foo", "Bar")
  end  
end