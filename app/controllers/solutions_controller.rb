class SolutionsController < ApplicationController
  def new
    redirect_to '/login' unless current_user
    @task = Task.find(params[:task_id])
    @solution = Solution.new

  end

  def show
    @solution = Solution.find(params[:id])
  end

  def create
    @task = Task.find_by(params[:task_id])
    @solution = Solution.new(solution_params)
    @solution.task_id = params[:task_id]
    @solution.user_id = current_user.id

    if pascal_compile(@solution.code)
      @solution.status = "Running"
      Thread.new do
        passed = run(@task.tests)
        if passed == @task.tests.count
          @solution.status = "success"
        else
          @solution.status = "failed"
        end
        @solution.save
      end

    else
      @solution.status = "failed"
    end


    if @solution.save

      redirect_to @solution
    else
      redirect_to '/'
    end
  end

  private
  def solution_params
    params.require(:solution).permit(:lang, :code)
  end

  def pascal_compile(code)
    File.open('task.pas', 'w') { |file| file.puts(code)}
    `fpc task.pas`.include?"lines compiled"
  end


  def run(tests)
    passed = 0
    `chmod +x script.sh`
    tests.all.each do |test|
      File.open("input.txt", "w") { |file| file.puts test.input }
      File.open("true_output.txt", "w") { |file| file.puts test.true_output }
      `./script.sh`
      passed += 1 if IO.read('output.txt') === IO.read('true_output.txt')
    end
    passed
  end
end
