class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]
  def index
    @bookings = policy_scope(Experience).where(user: current_user)
  end

  def new
    # @experience = Experience.find(params[:id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
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
