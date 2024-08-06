class Task < ApplicationRecord
  validates :name, :status, :creator, :completed, presence: true
end
