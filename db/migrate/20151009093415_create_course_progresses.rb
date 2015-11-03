class CreateCourseProgresses < ActiveRecord::Migration
  def change
    create_table :course_progresses do |t|
      t.integer :course_id
      t.integer :user_id
      t.integer :progress
      t.integer :current_topic_id

      t.timestamps
    end
  end
end
