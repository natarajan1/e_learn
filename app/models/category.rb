class Category < ActiveRecord::Base
  attr_accessible :category_name
  has_many :courses 
  validates :category_name, presence: true
end
