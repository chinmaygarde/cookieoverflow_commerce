class AddThumbsupToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :thumbsup, :integer, :default => 0
  end

  def self.down
    remove_column :users, :thumbsup
  end
end
