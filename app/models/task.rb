class Task < ActiveRecord::Base
  belongs_to :topic
  has_many :solutions
  has_many :tests

  def status(user)

    if user
      if self.solutions.where(status: "success", user_id: user.id).last
        :accepted
      elsif self.solutions.where(status: "failed", user_id: user.id).last
        :failed
      else
        :default
      end
    end

  end

  def success_solutions
    self.solutions.where(status: "success")
  end

  def failed_solutions
    self.solutions.where(status: "failed")
  end

  def default_solutions
    self.solutins.where(status: "default")
  end

end
