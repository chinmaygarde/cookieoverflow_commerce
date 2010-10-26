require 'spec_helper'

describe SearchController do

  describe "GET 'bid_item'" do
    it "should be successful" do
      get 'bid_item', :q => "Buzzy"
      response.should be_success
    end
  end
end
