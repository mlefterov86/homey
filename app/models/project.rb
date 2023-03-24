# frozen_string_literal: true

class Project < ApplicationRecord
  include AASM

  has_paper_trail only: [:state]
  has_many :comments, dependent: :destroy

  enum state: {
    to_do: 0,
    in_progress: 10,
    in_review: 20,
    tested: 30,
    done: 40
  }

  validates :name, :summary, presence: true

  # project states
  # do to
  # in progtess
  # review
  # approve -> only developer
  # tested -> only qa
  # done -> only pm

  aasm column: :state do
    state :to_do, initial: true
    state :in_progress
    state :in_review
    state :tested
    state :done

    event :in_progress do
      transitions from: %i[to_do in_review tested done], to: :in_progress
    end

    event :in_review do
      transitions from: :in_progress, to: :in_review
    end

    event :tested do
      transitions from: :in_review, to: :tested
    end

    event :done do
      transitions from: :tested, to: :done
    end
  end

  def tested!
    return unless current_user.role.qa? || current_user.role.pm?

    super
  end

  def done!
    return unless current_user.role.pm?

    super
  end

  def status
    {
      'to_do' => 'To Do',
      'in_progress' => 'In Progress',
      'in_review' => 'In Review',
      'tested' => 'Tested',
      'done' => 'Done'
    }[state]
  end

  private

  def current_user
    User.current_user
  end
end
