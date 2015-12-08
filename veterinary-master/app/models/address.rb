class Address < ActiveRecord::Base
  attr_accessible :city, :state, :street, :user_id, :zip
  belongs_to :user
  zip_regex = %r{\d{5}(-\d{4})?}
  
  
  validates :zip, :presence => true, :format => { :with => zip_regex }
  
  
  
end
