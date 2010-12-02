require 'spec_helper'

describe NotifyBiddersOfModifications do  
  def mock_bid(stubs={})
    @mock_tag ||= mock_model(Bid, stubs)
  end
  
  def mock_bid_item(stubs={})
    @mock_bid_item ||= mock_model(BidItem, stubs)
  end

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end

  def mock_bid(stubs={})
    @mock_tag ||= mock_model(Bid, stubs)
  end

  it "should enqueue the background job to notify the user of modifications" do
    user = User.stub(:find).with(1).and_return(mock_user)
    BidItem.stub(:find).and_return(mock_bid_item(:title => "something", :body => "else", :bids => [mock_bid(:user => mock_user)]))
    UserMailer.stub(:deliver_bid_item_modification_message).with(user, mock_bid_item)
    NotifyBiddersOfModifications.perform(14, "Foo")
  end
end