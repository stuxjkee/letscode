class CoursesController < ApplicationController

  before_action :require_login, only: [:start, :show, :new]
  before_action :require_editor, only: [:new, :destroy]

  def index
    @courses = Course.all
  end


  def start
    @course = Course.find(params[:id])
    @course_progress = CourseProgress.new(user_id: current_user.id, course_id: @course.id, progress: 0, current_topic_id: @course.topics.first.id)
    if @course_progress.save
      redirect_to '/'
    else
      redirect_to '/'
    end
  end


  def show
    @course = Course.find(params[:id])
    @topics = Topic.where(course_id: params[:id])
  end

  def destroy

  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create(course_params)
    redirect_to @course
  end

  private
  def course_params
    params.require(:course).permit(:title, :description, :lang, :topics, :img)
  end


end
