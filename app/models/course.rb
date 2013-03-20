class Course < ActiveRecord::Base
  attr_accessible :course_description, :course_name, :tutor
  belongs_to :category, dependent: :destroy
  validates :course_description, presence: true
  validates :course_name ,presence: true
  validates :tutor, presence: true

end
