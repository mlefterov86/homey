class Role < ApplicationRecord
  ROLES = %w[developer qa pm].freeze

  has_many :users, dependent: :nullify

  validates :name, presence: true
  validates_inclusion_of :name, in: ROLES
end
