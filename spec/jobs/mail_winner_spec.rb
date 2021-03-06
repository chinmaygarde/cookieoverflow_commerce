require 'spec_helper'

describe MailWinner do
  def mock_bid_item(stubs={})
    @mock_bid_item ||= mock_model(BidItem, stubs)
  end

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end
  
  def mock_bid(stubs={})
    @mock_tag ||= mock_model(Bid, stubs)
  end
  
  it "should enqueue the background job to mail the winner of a bid item" do
    user = User.stub(:find).with(1).and_return(mock_user)
    BidItem.stub(:find).and_return(mock_bid_item(:title => "something", :body => "else" ,:highest_bid => mock_bid(:bid_amount => 100, :user => mock_user)))
    UserMailer.stub(:deliver_winner_message).with(user, mock_bid_item)
    MailWinner.perform(14)
  end
end
