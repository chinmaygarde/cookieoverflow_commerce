require 'spec_helper'

describe "/messaging_controller/manage" do
  before(:each) do
    render 'messaging_controller/manage'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/messaging_controller/manage])
  end
end
