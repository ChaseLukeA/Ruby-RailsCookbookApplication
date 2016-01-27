json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :title, :ingredients, :instructions
  json.url recipe_url(recipe, format: :json)
end
