class Task < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { in: 1..256 }
end
