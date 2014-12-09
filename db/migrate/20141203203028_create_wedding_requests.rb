class CreateWeddingRequests < ActiveRecord::Migration
  def change
    create_table :wedding_requests do |t|
      t.integer :sender_id
      t.integer :reciever_id
      t.boolean :is_accepted, :default=>false
      t.boolean :is_cancel, :default=>false

      t.timestamps
    end
  end
end
