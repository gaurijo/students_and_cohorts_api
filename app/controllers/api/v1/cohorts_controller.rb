class Api::V1::CohortsController < ApplicationController
  def show
    if Cohort.exists?(params[:id])
      render json: CohortSerializer.new(Cohort.find(params[:id]))
    else 
      render json: {
        error: 'Cohort not available'
      }, status: 404
    end
  end
end