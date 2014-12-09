class AddImageAttachToSuccesses < ActiveRecord::Migration
  def self.up
    add_attachment :successes, :image
  end

  def self.down
    remove_attachment :successes, :image
  end
end
