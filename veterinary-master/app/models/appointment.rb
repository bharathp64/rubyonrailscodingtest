class Appointment < ActiveRecord::Base
  attr_accessible :date_of_visit, :doctor_id, :reminder, :pet_id, :reason, :user_id, :user_attributes, :pet_attributes
  belongs_to :user
  belongs_to :doctor, foreign_key: "doctor_id", class_name: "User"
  belongs_to :pet
  
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :user
  
  
  
end
