class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.text :input
      t.text :output
      t.text :true_output

      t.timestamps
    end
  end
end
