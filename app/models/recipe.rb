class Recipe < ActiveRecord::Base
  belongs_to :category
  validates :title, uniqueness: true
  validates_presence_of :title, :ingredients, :instructions, :calories
end
