class Task < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { in: 1..256 }
  validates :completed, inclusion: { in: [true, false] }
  validate :completion_time_after_creation_time

  def completion_time_after_creation_time
    if completion_time && completion_time < created_at
      errors.add(:completion_time, "Task creation time cannot exceed task completion time.")
    end
  end
end
