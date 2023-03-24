# frozen_string_literal: true

class Role < ApplicationRecord
  ROLES = %w[developer qa pm].freeze

  has_many :users, dependent: :nullify

  validates :name, presence: true
  validates :name, inclusion: ROLES

  ROLES.each do |role|
    define_method "#{role}?" do
      name == role
    end
  end
end
