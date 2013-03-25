class Course < ActiveRecord::Base
  attr_accessible :course_description, :course_name, :tutor,:category_id,:course_image
  belongs_to :category
  validates :course_description, presence: true
  validates :course_name ,presence: true
  validates :tutor, presence: true

end
