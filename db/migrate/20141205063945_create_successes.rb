class CreateSuccesses < ActiveRecord::Migration
  def change
    create_table :successes do |t|
    	t.integer :user_id
    	t.string  :name
    	t.date	  :marriage_date
    	t.text	  :story
      t.timestamps
    end
  end
end
