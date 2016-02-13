class Category < ActiveRecord::Base
  has_many :recipes, :dependent => :nullify
end
