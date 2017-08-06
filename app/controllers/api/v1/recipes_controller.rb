class Api::V1::RecipesController < ApplicationController
  def show
    @recipe = Recipe.find_by(id: params[:id])
    render "show.json.jbuilder"
  end
end
