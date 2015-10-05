class TopicsController < ApplicationController
  def index
  end

  def show

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
    @topic = Topic.create(topic_params)
    @topic.task.create(task_params)
    @topic.task.tests.create(test_params)
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :code, :task)
  end
  private
  def task_params
    params.require(:task).permit(:title, :condition, :tests)
  end
  private
  def test_params
    params.require(:test).permit(:input, :true_output)
  end
end
