class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
  end

  def show
    @experiences = Experience.find(params[:id])
  end
end
