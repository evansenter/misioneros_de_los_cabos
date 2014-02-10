class Notice < ActiveRecord::Base
  belongs_to :user
  
  validates :title, presence: true, uniqueness: true, length: { minimum: 10 }
  validates :body,  presence: true, uniqueness: true, length: { minimum: 10 }
  validates_associated :user
end
