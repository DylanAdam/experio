class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def index
    @experiences = policy_scope(Experience).order(created_at: :desc)
    @experiences = Experience.where.not(latitude: nil, longitude: nil)
    @markers = @experiences.map do |experience|
      {
        lng: experience.longitude,
        lat: experience.latitude
      }
    end
  end

  def show
    @experience = Experience.find(params[:id])
    @booking = Booking.new
    authorize @experience
  end

  def new
    @experience = Experience.new
    authorize @experience
  end

  def edit
    @experience = Experience.find(params[:id])
    authorize @experience
  end

  def create
    @experience = Experience.new(experiences_params)
    authorize @experience
    @experience.user = current_user
    if @experience.save!
      redirect_to experience_path(@experience)
    else
      render :new
    end
  end

  def update
    @experience.update(experiences_params)
    authorize @experience
    redirect_to experiences_path
  end

  def destroy
    @experience.destroy
    authorize @experience
    # Penser a renvoyer vers la home page !! (Alex)
    redirect_to
  end

  private

  def experiences_params
    params.require(:experience).permit(:title, :description, :address, :price, :capacity_min, :validity_date, :category, :user_id, :photo, :duration)
  end
end
