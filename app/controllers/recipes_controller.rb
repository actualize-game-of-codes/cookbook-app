class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render "index.html.erb"
  end

  def show
    recipe_id = params[:id]
    @recipe = Recipe.find_by(id: recipe_id)
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    recipe = Recipe.new(
      title: params[:form_title],
      chef: params[:form_chef],
      ingredients: params[:form_ingredients],
      directions: params[:form_directions]
    )
    recipe.save
    render "create.html.erb"
  end

  def edit
    recipe_id = params[:id]
    @recipe = Recipe.find_by(id: recipe_id)
    render "edit.html.erb"
  end
end
