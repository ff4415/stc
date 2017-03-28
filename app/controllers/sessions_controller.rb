class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:session][:type].eql? 'Student'
      student = Student.find_by(name: params[:session][:name].downcase)
      if student && student.authenticate(params[:session][:password])
        log_in student
        redirect_to student
      else
        render 'new'
      end
    elsif params[:session][:type].eql? 'Teacher'
      teacher = Teacher.find_by(name: params[:session][:name].downcase)
      if teacher && teacher.authenticate(params[:session][:password])
        log_in teacher
        redirect_to teacher
      else
        render 'new'
      end
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
