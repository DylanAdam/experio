class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :experience
  has_one :review
  validates :date, :number_of_participants, presence: true
  validates :number_of_participants, inclusion: { in: 1..50 }
end
