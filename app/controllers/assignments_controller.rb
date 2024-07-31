class AssignmentsController < ApplicationController
  before_action :set_course
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  def new
    @assignment = @course.assignments.build
  end

  def create
    @assignment = @course.assignments.build(assignment_params)
    @assignment.context_type = 'course'
    @assignment.root_account_id = @account.id 
    if @assignment.save
      redirect_to account_course_assignment_path(@account, @course, @assignment), success: 'Assignment was successfully created.'
    else
      render :new, alert: 'Something went wrong'
    end
  end
  
  

  def edit
  end

  def update
    if @assignment.update(assignment_params)
      redirect_to account_course_assignment_path(@account, @course, @assignment), success: 'Assignment was successfully updated.'
    else
      render :edit, alert: 'Something went wrong'
    end
  end

  def destroy
    if @assignment.destroy
      redirect_to account_course_assignments_path(@account, @course), notice: 'Assignment was successfully deleted.'
    else
      render :show, alert: 'Something went wrong'
    end
  end

  private

  def set_course
    @account = Account.find(params[:account_id])
    @course = @account.courses.find(params[:course_id])
  end

  def set_assignment
    @assignment = @course.assignments.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:title, :description, :context_type, :root_account_id)
  end
  
  
end
