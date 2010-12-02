class AddThumbsdownToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :thumbsdown, :integer, :default => 0
  end

  def self.down
    remove_column :users, :thumbsdown
  end
end
