class WeddingRequest < ActiveRecord::Base
  belongs_to :user, :foreign_key=>:sender_id, :class_name=>"WeddingRequest"
  belongs_to :user, :foreign_key=>:reciever_id, :class_name=>"WeddingRequest"
end
