require 'spec_helper'

describe SearchController do
  def mock_bid_item(stubs={})
    @mock_bid_item ||= mock_model(BidItem, stubs)
  end
  describe "GET 'bid_item'" do
    it "should be successful" do
      @bid_item = mock_bid_item(:title => "Foo")
      BidItem.stub(:search).and_return([@bid_item])

      # Hack alert! We need to mock a Paperclip attachment
      @bid_item_with_picture = mock_bid_item(:url => "something")
      @bid_item.should_receive(:picture).and_return(@bid_item_with_picture)
      @bid_item_with_gsub = mock_bid_item(:gsub => "something")
      @bid_item_with_picture.should_receive(:url).and_return(@bid_item_with_gsub)
      @bid_item_with_gsub.should_receive(:gsub)

      get 'bid_item', :q => "Buzzy"
      response.should be_success
    end
  end
end
