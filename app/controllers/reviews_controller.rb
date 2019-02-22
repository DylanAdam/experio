class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    authorize @review
    @review.booking = @booking
    if @review.save
      redirect_to bookings_path
    else
      render 'bookings/index'
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @review = Review.new
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
