class RecipesController < ApplicationController
  def index
    sort_attribute = params[:sort_by]
    search_terms = params[:input_search_terms]

    if search_terms
      @recipes = Recipe.where("title ILIKE ?", "%" + search_terms + "%")
    else
      @recipes = Recipe.all
    end

    if sort_attribute
      @recipes = @recipes.all.order(sort_attribute)
    end
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
    flash[:success] = "Recipe successfully created!"
    redirect_to "/recipes/#{recipe.id}"
  end

  def edit
    recipe_id = params[:id]
    @recipe = Recipe.find_by(id: recipe_id)
    render "edit.html.erb"
  end

  def update
    recipe_id = params[:id]
    @recipe = Recipe.find_by(id: recipe_id)
    @recipe.title = params[:form_title]
    @recipe.chef = params[:form_chef]
    @recipe.ingredients = params[:form_ingredients]
    @recipe.directions = params[:form_directions]
    @recipe.save
    flash[:success] = "Recipe successfully updated!"
    redirect_to "/recipes/#{@recipe.id}"
  end

  def destroy
    recipe_id = params[:id]
    @recipe = Recipe.find_by(id: recipe_id)
    @recipe.destroy
    flash[:warning] = "Recipe successfully destroyed!"
    redirect_to "/recipes"
  end
end
