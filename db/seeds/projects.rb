# frozen_string_literal: true

Project.aasm.states.map(&:name).each do |state|
  project = Project.new
  project.name = "#{state.to_s.humanize} Project"
  project.summary = Faker::Markdown.sandwich(sentences: 6, repeat: 3)
  project.state = state
  project.save!
end
