require 'spec_helper'

describe "/auto_inc_requests/create" do
  before(:each) do
    render 'auto_inc_requests/create'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/auto_inc_requests/create])
  end
end
