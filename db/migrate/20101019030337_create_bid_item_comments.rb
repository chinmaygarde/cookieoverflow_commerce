class CreateBidItemComments < ActiveRecord::Migration
  def self.up
    create_table :bid_item_comments do |t|
      t.integer :user_id
      t.integer :bid_item_id
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :bid_item_comments
  end
end
