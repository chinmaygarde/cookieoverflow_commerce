require 'spec_helper'

describe SearchController do
  def mock_bid_item(stubs={})
    @mock_bid_item ||= mock_model(BidItem, stubs)
  end

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs)
  end

  describe "GET 'bid_item'" do
      it "should be successful" do
        BidItem.stub(:search).and_return([Factory(:bid_item, :title => "my item")])
        get 'bid_item', :q => "Buzzy" , :format => :json
        (response.body =~ /my item/).should be_true
      end
    end

  describe "GET 'user'" do
      it "should be successful" do
        User.stub(:search).and_return([Factory(:user, :email => "foobuzzy@bar.com"), Factory(:user, :email => "barbuzzy@bar.com")])
        get 'user', :q => "Buzzy", :format => :json
        (response.body =~ /foobuzzy@bar.com/).should be_true
        (response.body =~ /barbuzzy@bar.com/).should be_true
      end
    end
end
