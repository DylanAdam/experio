class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @experience = Experience.find(params[:id])
  end
end
