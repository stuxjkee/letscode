class AddTopicIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :topic_id, :integer
  end
end
