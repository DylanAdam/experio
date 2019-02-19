class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def index
    @experiences = Experience.all
  end

  def show
    @experiences = Experience.find(params[:id])
  end

  def experiences_params
  params.require(:experience).permit(:title, :description, :photo)
end
end
