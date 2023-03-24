require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to(:project) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:project) }
  it { is_expected.to validate_presence_of(:text) }
end
