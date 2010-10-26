require 'spec_helper'

describe "/tags/destroy" do
  before(:each) do
    render 'tags/destroy'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/tags/destroy])
  end
end
