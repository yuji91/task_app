class Task < ApplicationRecord
  enum status: { todo: 0, doing: 1, done: 2 }
  validates :title, presence: true
  validates :status, presence: true
  validates :deadline, presence: true
  validate :deadline, :must_be_after_today

  def must_be_after_today
    errors.add(:deadline, "deadline must be after today.") if deadline.present? && deadline < Date.today
  end
end
