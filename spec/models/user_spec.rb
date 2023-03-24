# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to belong_to(:role) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }
end
