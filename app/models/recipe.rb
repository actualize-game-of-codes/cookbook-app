class Recipe < ApplicationRecord
  def ingredients_list
    array = ingredients.split(", ")
    new_array = []
    array.each do |ingredient|
      if ingredient.ends_with?(".")
        new_array << ingredient.upcase.chomp(".")
      else
        new_array << ingredient.upcase
      end
    end
    return new_array
  end

  def directions_list
    return directions.split(", ").map { |direction| direction.capitalize }
  end
end
