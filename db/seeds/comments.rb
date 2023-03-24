Project.all.each do |project|
  5.times do |n|
    Comment.create!(
      text: Faker::Markdown.sandwich,
      project: project,
      user: User.all[rand(User.count)]
    )
  end
end
