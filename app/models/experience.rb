class Experience < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :title, :description, :address, :price, :photo, :capacity_min, :validity_date, :category, presence: true
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
  pg_search_scope :search_by_title_description_address_and_category,
                  against: [:title, :description, :address, :category],
                  using: {
                    tsearch: { prefix: true }
                  }
end
