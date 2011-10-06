class CreateShares < ActiveRecord::Migration
  def self.up
    create_table :shares do |t|
      t.integer :bookmark_id, :null => false
      t.integer :shared_by, :null => false
      t.integer :shared_with, :null => false
      t.timestamps
    end
    add_index :shares, :bookmark_id
    add_index :shares, :shared_by
    add_index :shares, :shared_with
  end

  def self.down
    drop_table :shares
  end
end
