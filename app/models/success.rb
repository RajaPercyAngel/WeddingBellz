class Success < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "250x150#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
   validates :name, :marriage_date, :story, presence: true
end
