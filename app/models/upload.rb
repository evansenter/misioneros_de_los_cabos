class Upload < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :title, :s3_url
  validates_uniqueness_of :title, :s3_url
  validates_associated :user
end
