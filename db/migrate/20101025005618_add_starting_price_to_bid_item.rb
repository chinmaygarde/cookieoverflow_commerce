class AddStartingPriceToBidItem < ActiveRecord::Migration
  def self.up
    add_column :bid_items, :starting_price, :integer
  end

  def self.down
    remove_column :bid_items, :starting_price
  end
end
