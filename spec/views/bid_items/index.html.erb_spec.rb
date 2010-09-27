require 'spec_helper'

describe "/bid_items/index.html.erb" do
  include BidItemsHelper

  before(:each) do
    assigns[:bid_items] = [
      stub_model(BidItem,
        :title => "value for title",
        :body => "value for body"
      ),
      stub_model(BidItem,
        :title => "value for title",
        :body => "value for body"
      )
    ]
  end

  it "renders a list of bid_items" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
  end
end
