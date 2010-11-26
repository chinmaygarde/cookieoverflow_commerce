class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :from_user
      t.integer :to_user
      t.text :message
      t.boolean :unread, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
