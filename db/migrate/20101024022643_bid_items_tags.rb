class BidItemsTags < ActiveRecord::Migration
  def self.up
     create_table :bid_items_tags, :id => false do |t|
      t.references :bid_item, :tag

      t.timestamps
     end
  end

  def self.down
    drop_table :bid_items_tags
  end
end
