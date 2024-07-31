class CoursesController < ApplicationController
  before_action :set_account
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = @account.courses.order('created_at DESC')
  end

  def new
    @course = @account.courses.build
  end

  def create
    @course = @account.courses.build(course_params.merge(workflow_state: @account.workflow_state))
    if @course.save
      redirect_to account_course_path(@account, @course), success: 'Course was successfully created.'
    else
      render :new, error: 'Something went wrong'
    end
  end

  def show
    @assignments = @course.assignments.order('created_at DESC')
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to account_course_path(@account, @course), success: 'Course was successfully updated.'
    else
      render :edit, error: 'Something went wrong'
    end
  end

  def destroy
    if @course.destroy
      redirect_to account_courses_path(@account), notice: 'Course was successfully deleted.'
    else
      render :show, alert: 'Something went wrong'
    end
  end

  private

  def set_course
    @course = @account.courses.find(params[:id])
  end

  def set_account
    @account = Account.find(params[:account_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Account not found'
  end

  def course_params
    params.require(:course).permit(:name, :start_at, :conclude_at, :course_code, :account_id, :root_account_id, :enrollment_term_id)
  end
end
