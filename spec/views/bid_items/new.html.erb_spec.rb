require 'spec_helper'

describe "/bid_items/new.html.erb" do
  include BidItemsHelper

  before(:each) do
    assigns[:bid_item] = stub_model(BidItem,
      :new_record? => true,
      :title => "value for title",
      :body => "value for body"
    )
  end

  it "renders new bid_item form" do
    render

    response.should have_tag("form[action=?][method=post]", bid_items_path) do
      with_tag("input#bid_item_title[name=?]", "bid_item[title]")
      with_tag("textarea#bid_item_body[name=?]", "bid_item[body]")
    end
  end
end
