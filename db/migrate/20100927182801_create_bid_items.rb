class CreateBidItems < ActiveRecord::Migration
  def self.up
    create_table :bid_items do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :bid_items
  end
end
