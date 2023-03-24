Role.all.each do |role|
  User.create!(
    email: "#{role.name}@example.com",
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    password: '123456',
    password_confirmation: '123456',
    role: role
  )
end
