class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])
    @booking = Booking.new
  end

  def new
    @experience = Experience.new
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def create
    @experience = Experience.new(experiences_params)
    if @experience.save
      redirect_to experience_path(experience)
    else
      render :new
    end
  end

  def update
    @experience.update(experiences_params)
    redirect_to experiences_path
  end

  def destroy
    @experience.destroy
    redirect_to
  end

  private

  def experiences_params
    params.require(:experience).permit(:title, :description, :address, :price, :capacity_min, :validity_date, :category, :user_id, :picture, :duration)
  end
end
