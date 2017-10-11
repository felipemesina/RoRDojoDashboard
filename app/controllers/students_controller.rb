class StudentsController < ApplicationController
  def index
  end

  def new
    @dojos = Dashboard.all
    @dojo = Dashboard.find(params[:dashboard_id])
  end


  def show
    @student = Student.find(params[:student_id])
    @cohort = Student.cohort(@student)


  end

  def edit
    @student = Student.find(params[:id])
    @dojos = Dashboard.all

  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to root_url
    else
      flash[:errors] = @dojo.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    Student.destroy(params[:id])
    redirect_to root_url
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to root_url, notice: "Welcome Student!"
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to :back
    end
  end

  private
    def student_params
      params.require(:student).permit(:first_name, :last_name, :email, :dashboard_id)
    end
end
