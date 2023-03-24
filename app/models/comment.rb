class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :project, :user, :text, presence: true
end
