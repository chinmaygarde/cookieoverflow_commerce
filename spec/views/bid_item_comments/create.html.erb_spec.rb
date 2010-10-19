require 'spec_helper'

describe "/bid_item_comments/create" do
  before(:each) do
    render 'bid_item_comments/create'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/bid_item_comments/create])
  end
end
