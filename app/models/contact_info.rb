class ContactInfo < ActiveRecord::Base
  NUMBER_COLUMNS = [:phone_number]
  
  belongs_to :user
  
  validates :full_name,    presence: true
  validates :address_1,    presence: true
  validates :city,         presence: true
  validates :state,        presence: true
  validates :zip,          presence: true
  validates :country,      presence: true  
  validates :phone_number, presence: true, numericality: { only_integer: true, greater_than: 0, if: "phone_number.present?" }
  validates :unit_number,  presence: true
  
  before_validation :only_digits, only: NUMBER_COLUMNS
  
  def full_address
    Snail.new(
      line_1:      address_1,
      line_2:      address_2,
      city:        city,
      region:      state,
      postal_code: zip,
      country:     country
    ).to_s.gsub(/\s+/, " ")
  end
  
  private
  
  def only_digits
    NUMBER_COLUMNS.each do |attribute|
      write_attribute(attribute, read_attribute(attribute).gsub(/\D/, "")) if read_attribute(attribute).present?
    end
  end
end
