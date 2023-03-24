# frozen_string_literal: true

Project.all.each do |project|
  5.times do
    comment = Comment.new
    comment.text = Faker::Markdown.sandwich
    comment.project = project
    comment.user = User.all[rand(User.count)]
    comment.save!
  end
end
