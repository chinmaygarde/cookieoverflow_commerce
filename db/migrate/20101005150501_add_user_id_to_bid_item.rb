class AddUserIdToBidItem < ActiveRecord::Migration
  def self.up
    add_column :bid_items, :user_id, :integer
  end

  def self.down
    remove_column :bid_items, :user_id
  end
end
