class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def index
    @experiences = Experience.all
  end

  def show
    @experiences = Experience.find(params[:id])
  end
end
