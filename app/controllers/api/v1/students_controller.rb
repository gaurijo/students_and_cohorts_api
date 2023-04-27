class Api::V1::StudentsController < ApplicationController 
  def index 
    render json: Student.all 
  end
end