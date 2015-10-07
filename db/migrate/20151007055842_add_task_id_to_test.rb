class AddTaskIdToTest < ActiveRecord::Migration
  def change
    add_column :tests, :task_id, :integer
  end
end
