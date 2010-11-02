class AddEndTimeToBidItem < ActiveRecord::Migration
  def self.up
    add_column :bid_items, :end_time, :datetime
  end

  def self.down
    remove_column :bid_items, :end_time
  end
end
