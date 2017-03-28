class TeachersController < ApplicationController
  def new
  end

  def show
    @teacher = Teacher.find(params[:id])
  end
end
