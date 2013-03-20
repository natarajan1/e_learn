class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :course_description
      t.string :tutor

      t.timestamps
    end
  end
end
