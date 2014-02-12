class Upload < ActiveRecord::Base
  belongs_to :user
  
  validates :title, presence: true, uniqueness: true, length: { minimum: 10 }
  validates :s3_url, presence: true, uniqueness: true
  validates_associated :user
end
