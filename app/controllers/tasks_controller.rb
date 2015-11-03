class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def new_test
    @test = Test.new
  end

  def create_test
    @test = Test.new(test_params)

    if @test.save
      redirect_to '/'
    else
      redirect_to 'tasks/new_test'
    end

  end

  def statistic
    @task = Task.find(params[:id])
    @success_solutions = @task.solutions.where(status: "success")

    respond_to do |format|
      format.json
      format.html
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :condition)
  end

  private
  def test_params
    params.require(create_test_path).permit(:input, :true_output)
  end

end
