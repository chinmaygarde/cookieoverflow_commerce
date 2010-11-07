require 'spec_helper'

describe MailSeller do
  def mock_bid_item(stubs={})
    @mock_bid_item ||= mock_model(BidItem, stubs)
  end

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end
  
  def mock_bid(stubs={})
    @mock_tag ||= mock_model(Bid, stubs)
  end
  
  it "should enqueue the background job to mail the seller of a bid item" do
    User.stub(:find).with(1).and_return(mock_user)
    BidItem.stub(:find).and_return(mock_bid_item(:title => "something", :body => "else" , :user => mock_user, :highest_bid => mock_bid(:bid_amount => 100, :user => mock_user)))
    UserMailer.stub(:deliver_seller_message).with(mock_user, mock_bid_item)
    MailSeller.perform(14)
  end
  
  it "should send the seller a negative message if his bid item has no bids" do
    User.stub(:find).with(1).and_return(mock_user)
    BidItem.stub(:find).and_return(mock_bid_item(:title => "something", :body => "else" , :user => mock_user, :highest_bid => nil))
    UserMailer.stub(:deliver_seller_message).with(mock_user, mock_bid_item)
    MailSeller.perform(12)
  end
end
