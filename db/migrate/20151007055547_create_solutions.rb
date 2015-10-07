class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.integer :task_id
      t.integer :user_id
      t.string :lang
      t.text :code
      t.string :status

      t.timestamps
    end
  end
end
