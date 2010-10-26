require 'spec_helper'

describe SearchController do
  def mock_bid_item(stubs={})
    @mock_bid_item ||= mock_model(BidItem, stubs)
  end
  describe "GET 'bid_item'" do
    it "should be successful" do
      BidItem.stub(:search).and_return([mock_bid_item(:title => "Foo")])
      get 'bid_item', :q => "Buzzy"
      response.should be_success
    end
  end
end
