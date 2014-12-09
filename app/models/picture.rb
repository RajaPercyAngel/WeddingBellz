class Picture < ActiveRecord::Base
  has_attached_file :image, :styles => {:thumb => "200x150>", :medium => "800x600>", :gallery=>"653x400#"}
  belongs_to :user
  validates_presence_of :title
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => 'image/jpeg'
end
