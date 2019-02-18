class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]
  def index
    @bookings = Booking.where(user: current_user)
  end

  def new
    @experience = Experience.find(params[:experience_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.experience = Experience.find(params[:experience_id])
    @booking.user = current_user
    @booking.save
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :number_of_participants)
  end
end
