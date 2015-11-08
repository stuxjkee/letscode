module TopicsHelper
  def topic_passed?(topic, user)
    passed_count = 0
    topic.tasks.each do |task|
      passed_count += 1 if task.passed_by?(user)
    end
    passed_count == topic.tasks.count
  end
end
