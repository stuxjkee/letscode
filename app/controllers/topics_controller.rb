class TopicsController < ApplicationController
  def index
  end

  def show
    @topic = Topic.find(params[:id])

  end

  def destroy
  end

  def edit
  end

  def update
  end

  def new
    @topic = Topic.new
  end

  def create
    @course = Course.find(params[:topic][:course_id])
    @topic = @course.topics.create(topic_params)

    if @topic.save
      redirect_to @course
    else
      redirect_to 'tasks/new'
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :code, :course)
  end
end
