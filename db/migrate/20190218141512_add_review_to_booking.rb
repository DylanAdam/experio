class AddReviewToBooking < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :review, foreign_key: true
  end
end
