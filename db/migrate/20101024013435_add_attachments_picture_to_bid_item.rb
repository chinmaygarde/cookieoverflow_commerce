class AddAttachmentsPictureToBidItem < ActiveRecord::Migration
  def self.up

    add_column :bid_items, :picture_file_name, :string
    add_column :bid_items, :picture_content_type, :string
    add_column :bid_items, :picture_file_size, :integer
    add_column :bid_items, :picture_updated_at, :datetime

  end

  def self.down

    remove_column :bid_items, :picture_file_name
    remove_column :bid_items, :picture_content_type
    remove_column :bid_items, :picture_file_size
    remove_column :bid_items, :picture_updated_at

  end
end
