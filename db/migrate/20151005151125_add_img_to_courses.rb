class AddImgToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :img, :string
  end
end
