class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name,
                   :role_id, :profile_attributes, :address_attributes, :pet_attributes
  # attr_accessible :title, :body
  scope :doctors, -> { where( role: Role.doctor_role ) }
  ROLES = ['admin', 'doctor', 'receptionist', 'customer']
  
  before_create :set_role
  
  belongs_to :role
  has_one :address
  has_one :profile
  has_many :appointments
  has_one :pet
  
  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :pet
  
  validates :name, length: { maximum: 45 }
  
  ROLES.each do |role|
    define_method "#{role}?" do
      self.role.name == role
    end
  end
  
  def self.doctors
      all.collect {|doctor|   [doctor.name, doctor.id] if  doctor.role.name == "doctor" }.compact
  end
  
  
  private
  
  def set_role
    self.role ||=Role.find_by_name('customer')
  end
  
end
