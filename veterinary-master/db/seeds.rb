# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['admin', 'doctor', 'receptionist', 'customer'].each do |role|
  Role.find_or_create_by_name role
end

['dog', 'cat', 'bird'].each do |type|
  PetType.find_or_create_by_name type
end

User.delete_all

user = User.create(email: "admin@rackspace.com", password: "password", password_confirmation: "password", name: "Owner")
user.role = Role.find_by_name("admin")
user.save

doctor_bob = User.create(email: "doctor_bob@rackspace.com", password: "password", password_confirmation: "password", name: "Bob")
doctor_bob.role = Role.find_by_name("doctor")
doctor_bob.save

doctor_susan = User.create(email: "doctor_susan@rackspace.com", password: "password", password_confirmation: "password", name: "Susan")
doctor_susan.role = Role.find_by_name("doctor")
doctor_susan.save


receptionist = User.create(email: "receptionist@rackspace.com", password: "password", password_confirmation: "password", name: "Receptionist")
receptionist.role = Role.find_by_name("receptionist")
receptionist.save


customer = User.create(email: "customer@rackspace.com", password: "password", password_confirmation: "password", name: "Customer")
customer.role = Role.find_by_name("customer")
customer.save