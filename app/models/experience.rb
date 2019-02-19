class Experience < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  validates :title, :description, :address, :photo, :price, :capacity_min, :validity_date, :category, presence: true
  mount_uploader :photo, PhotoUploader
end
