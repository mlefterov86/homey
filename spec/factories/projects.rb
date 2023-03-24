# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    name { 'MyString' }
    summary { 'MyText' }
    state { 1 }
  end
end
