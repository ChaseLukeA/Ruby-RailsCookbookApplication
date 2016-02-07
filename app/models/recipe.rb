class Recipe < ActiveRecord::Base
  validates_presence_of :title, :ingredients, :instructions
  validates :title, uniqueness: true
end
