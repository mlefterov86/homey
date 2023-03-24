Project.aasm.states.map(&:name).each do |state|
  Project.create!(
    name: "#{state.to_s.humanize} Project",
    summary: Faker::Markdown.sandwich(sentences: 6, repeat: 3),
    state: state
  )
end
