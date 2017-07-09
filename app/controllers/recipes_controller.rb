class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render "index.html.erb"
  end

  def one_recipe_method
    @recipe = Recipe.first
    render "one_recipe.html.erb"
  end
end
