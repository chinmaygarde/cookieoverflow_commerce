require 'spec_helper'

describe "/bid_items/edit.html.erb" do
  include BidItemsHelper

  before(:each) do
    assigns[:bid_item] = @bid_item = stub_model(BidItem,
      :new_record? => false,
      :title => "value for title",
      :body => "value for body",
      :next_bid_delta => 10,
      :end_time => 100.days.from_now
    )
  end

  it "renders the edit bid_item form" do
    render

    response.should have_tag("form[action=#{bid_item_path(@bid_item)}][method=post]") do
      with_tag('input#bid_item_title[name=?]', "bid_item[title]")
      with_tag('textarea#bid_item_body[name=?]', "bid_item[body]")
    end
  end
end
