class AddCaloriesToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :calories, :int
  end
end
