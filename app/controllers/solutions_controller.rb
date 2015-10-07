class SolutionsController < ApplicationController
  def new
    @task = Task.find(params[:task_id])
    @solution = Solution.new
  end

  def create
    @task = Task.find_by(params[:task_id])
    @solution = @task.solutions.new(solution_params)
    @solution.user_id = current_user.id

    @solution.status = "Compiling"

    if @solution.save
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  private
  def solution_params
    params.require(:solution).permit(:lang, :code)
  end
end
