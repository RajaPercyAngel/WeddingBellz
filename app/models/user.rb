class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable 


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :gallery => "653x400#" ,  :list => "200x200#" , :profile => "160x150>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :sent_requests, :foreign_key=>:sender_id, :class_name=>"WeddingRequest"
  has_many :recieve_requests, :foreign_key=>:reciever_id, :class_name=>"WeddingRequest"

  scope :male_users, where(:gender => "Male")
  scope :female_users, where(:gender => "Female")

  has_many :pictures, :dependent => :destroy
  
 

	def age
 	 now = Time.now.utc.to_date
 	 now.year - dob.year - (dob.to_date.change(:year => now.year) > now ? 1 : 0)
	end

  def details
    "#{age}, #{occupation}, #{state}, #{living_in}"
  end

  def name
    "#{first_name} #{last_name}"
  end

  
end
