class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    if params[:user][:type] == "Student"
      @student = Student.new(user_params)
      if @student.save
        log_in @student
        redirect_to student_url(@student)
      else
        render 'new'
      end
    elsif params[:user][:type] == "Teacher"
      @teacher = Teacher.new(user_params)
      if @teacher.save
        log_in @teacher
        redirect_to @teacher
      else
        render 'new'
      end
    else
      render "new"
    end
  end

  def show
    @class_rooms = ClassRoom.all
    @students = Student.all
    @teachers = Teacher.all
  end

  def edit
    @user = User.find(params[:id])
    @class_rooms = ClassRoom.all
  end

  def update
    class_room = nil
    class_room = ClassRoom.find(params[:classroom][:id]) unless params[:classroom][:id].blank?
    user = User.find(params[:id])
    user.class_rooms.clear
    if class_room.nil? || user.nil?
      redirect_to user_path(current_user)
      return
    end
    user.class_rooms << class_room
    redirect_to user_path(current_user)
  end

  def destroy
    # debugger
    User.find(params[:id]).destroy unless params[:id].eql? current_user.id.to_s
    redirect_to user_path(current_user)
  end

  def create_room
    class_room = nil
    class_room = ClassRoom.find_by(name:params[:name])
    if class_room.nil?
      class_room = ClassRoom.create(name: params[:name])
    end
    redirect_to user_path(current_user)
  end

  def destroy_room
    ClassRoom.find(params[:id]).destroy
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :admin, :password,
    :password_confirmation)
  end

end
