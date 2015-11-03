class SolutionsController < ApplicationController
  def new
    @task = Task.find(params[:task_id])
    @solution = Solution.new

  end

  def show
    @solution = Solution.find(params[:id])
  end

  def create
    @task = Task.find_by(params[:task_id])
    @solution = @task.solutions.new(solution_params)
    @solution.user_id = current_user.id

    if pascal_compile(@solution.code)
      @solution.status = "Running"
      Thread.new do
        passed = run(@task.tests)
        @solution.status = "#{passed} tests pased"
        @solution.save
      end

    else
      @solution.status = "Compilation error"
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
