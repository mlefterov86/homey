# frozen_string_literal: true

Role.all.each do |role|
  user = User.new
  user.email = "#{role.name}@example.com"
  user.firstname = Faker::Name.first_name
  user.lastname = Faker::Name.last_name
  user.password = '123456'
  user.password_confirmation = '123456'
  user.role = role
  user.save!
end
