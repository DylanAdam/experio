class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :experience
  has_one :review
  validates :date, presence: true
  validates :number_of_participants, presence: true
  validates :number_of_participants, inclusion: { in: 1..1000 }
  validate :number_of_participants_sup_experience_min_participant
  validate :booking_date_sup_today
  validate :booking_date_inf_validity_date
end

private

def number_of_participants_sup_experience_min_participant
  return if number_of_participants.nil?

  if number_of_participants < experience.capacity_min
    errors.add(:number_of_participants, "has to be #{experience.capacity_min} at least")
  end
end

def booking_date_sup_today
  return if date.nil?

  if date < Date.today
    errors.add(:date, "picked can't be before today")
  end
end

def booking_date_inf_validity_date
  return if date.nil?

  if date > experience.validity_date
    errors.add(:date, "picked can't be after the valdity date of the experience")
  end
end
