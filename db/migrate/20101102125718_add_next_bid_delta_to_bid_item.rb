class AddNextBidDeltaToBidItem < ActiveRecord::Migration
  def self.up
    add_column :bid_items, :next_bid_delta, :integer
  end

  def self.down
    remove_column :bid_items, :next_bid_delta
  end
end
