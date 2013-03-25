class Category < ActiveRecord::Base
  attr_accessible :category_name
  has_many :courses , dependent: :destroy
  validates :category_name, presence: true
end
