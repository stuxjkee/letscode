class CoursesController < ApplicationController
  def index
    @courses = Course.all
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
