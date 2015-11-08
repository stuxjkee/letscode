module CoursesHelper
  def course_progress(course_id, user_id)
    CourseProgress.where(course_id: course_id, user_id: user_id).last
  end
end
