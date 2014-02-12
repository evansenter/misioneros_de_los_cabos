class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ROLES = %w|unauthorized authorized admin|
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  paginates_per 25
  
  has_one  :contact_info
  has_many :notices
  has_many :uploads
  
  accepts_nested_attributes_for :contact_info
  
  validates :role, inclusion: { in: ROLES }
  validates_associated :contact_info, message: "is not complete"
  
  delegate :full_name, to: :contact_info
  
  ROLES.each do |role|
    define_method(:"#{role}?") do
      self.role == role || self.role == "admin"
    end
    
    define_method(:"set_#{role}!") do
      update_attribute(:role, role)
    end
  end
  
  def revoke_authorization!
    update_attribute(:role, "")
  end
end
