class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.integer :process
      t.text :lang
      t.timestamps
    end
  end
end
