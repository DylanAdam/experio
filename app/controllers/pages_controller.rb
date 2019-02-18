class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @experiences = Experience.all
  end

  def index
    @experiences = Experience.all
  end

  def show
    @experiences = Experience.find(params[:id])
  end
end
