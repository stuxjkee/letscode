class CourseProgress < ActiveRecord::Base
  belongs_to :course
  belongs_to :user


  def current_topic
    Topic.find(self.current_topic_id)
  end

end
