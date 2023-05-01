class Api::V1::CohortsController < ApplicationController
  def show
    if Cohort.exists?(params[:id])
      render json: Cohort.find(params[:id])
    else 
      render json: 404
    end
  end
end