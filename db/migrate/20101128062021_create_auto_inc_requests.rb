class CreateAutoIncRequests < ActiveRecord::Migration
  def self.up
    create_table :auto_inc_requests do |t|
      t.integer :user_id
      t.integer :bid_item_id
      t.integer :maximum_amount

      t.timestamps
    end
  end

  def self.down
    drop_table :auto_inc_requests
  end
end
