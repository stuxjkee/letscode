class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :condition
      t.string :status

      t.timestamps
    end
  end
end
