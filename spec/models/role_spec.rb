# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  it { is_expected.to have_many(:users).dependent(:nullify) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_inclusion_of(:name).in_array(Role::ROLES) }
end
