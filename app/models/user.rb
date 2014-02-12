class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  has_one  :contact_info
  has_many :notices
  has_many :uploads
  
  accepts_nested_attributes_for :contact_info
  
  validates_associated :contact_info, message: "is not complete"
end
