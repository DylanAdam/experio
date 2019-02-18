class Experience < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  validates :title, :description, :address, :picture, :price, :capacity_min, :validity_date, :category, presence: true
end
