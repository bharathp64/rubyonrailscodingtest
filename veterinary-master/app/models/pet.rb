class Pet < ActiveRecord::Base
  attr_accessible :age, :breed, :doctor_id, :last_visit, :name, :user_id, :weight
  belongs_to :user
  belongs_to :pet_type
  
  validates :name, length: { maximum: 45 }
  
end
