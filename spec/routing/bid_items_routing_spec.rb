require 'spec_helper'

describe BidItemsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/bid_items" }.should route_to(:controller => "bid_items", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/bid_items/new" }.should route_to(:controller => "bid_items", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/bid_items/1" }.should route_to(:controller => "bid_items", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/bid_items/1/edit" }.should route_to(:controller => "bid_items", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/bid_items" }.should route_to(:controller => "bid_items", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/bid_items/1" }.should route_to(:controller => "bid_items", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/bid_items/1" }.should route_to(:controller => "bid_items", :action => "destroy", :id => "1") 
    end
  end
end
