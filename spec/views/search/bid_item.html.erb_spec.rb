require 'spec_helper'

describe "/search/bid_item" do
  before(:each) do
    render 'search/bid_item'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/search/bid_item])
  end
end
