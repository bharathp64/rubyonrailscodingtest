class Profile < ActiveRecord::Base
  attr_accessible :school, :user_id, :years_practice
  
  validates :years_practice, :inclusion => 1..100
end
