class ContactInfo < ActiveRecord::Base
  belongs_to :user
  
  validates :address_1,    presence: true
  validates :city,         presence: true
  validates :state,        presence: true
  validates :zip,          presence: true
  validates :country,      presence: true  
  validates :phone_number, presence: true, numericality: { only_integer: true, greater_than: 0, if: "phone_number.present?" }
  validates :unit_number,  presence: true, numericality: { only_integer: true, greater_than: 0, if: "unit_number.present?" }
end
