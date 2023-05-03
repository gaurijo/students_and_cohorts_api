class Api::V1::StudentsController < ApplicationController 
  def index 
    render json: StudentSerializer.new(Student.all)
  end
end