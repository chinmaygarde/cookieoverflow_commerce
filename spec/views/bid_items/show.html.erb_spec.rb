require 'spec_helper'

describe "/bid_items/show.html.erb" do
  include BidItemsHelper
  before(:each) do
    assigns[:bid_item] = @bid_item = stub_model(BidItem,
      :title => "value for title",
      :body => "value for body"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ body/)
  end
end
